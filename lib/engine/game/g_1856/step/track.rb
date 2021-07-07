# frozen_string_literal: true

require_relative '../../../step/base'
require_relative '../../../step/track'
module Engine
  module Game
    module G1856
      module Step
        class Track < Engine::Step::Track
          def check_track_restrictions!(entity, old_tile, new_tile)
            return if @game.loading || !entity.operator?

            graph = @game.graph_for_entity(entity)

            # Don't check that towns are preserved

            old_paths = old_tile.paths
            changed_city = false
            used_new_track = old_paths.empty?

            new_tile.paths.each do |np|
              next unless graph.connected_paths(entity)[np]

              op = old_paths.find { |path| np <= path }
              used_new_track = true unless op
              old_revenues = op&.nodes && op.nodes.map(&:max_revenue).sort
              new_revenues = np&.nodes && np.nodes.map(&:max_revenue).sort
              changed_city = true unless old_revenues == new_revenues
            end

            case @game.class::TRACK_RESTRICTION
            when :permissive
              true
            when :city_permissive
              raise GameError, 'Must be city tile or use new track' if new_tile.cities.none? && !used_new_track
            when :restrictive
              raise GameError, 'Must use new track' unless used_new_track
            when :semi_restrictive
              raise GameError, 'Must use new track or change city value' if !used_new_track && !changed_city
            else
              raise
            end
          end

          def legal_tile_rotation?(entity, hex, tile)
            old_paths = hex.tile.paths
            old_ctedges = hex.tile.city_town_edges

            new_paths = tile.paths
            new_exits = tile.exits
            new_ctedges = tile.city_town_edges
            extra_cities = [0, new_ctedges.size - old_ctedges.size].max

            new_exits.all? { |edge| hex.neighbors[edge] } &&
              (new_exits & hex_neighbors(entity, hex)).any? &&
              old_paths_are_preserved(old_paths, new_paths) &&
              # Count how many cities on the new tile that aren't included by any of the old tile.
              # Make sure this isn't more than the number of new cities added.
              # 1836jr30 D6 -> 54 adds more cities
              extra_cities >= new_ctedges.count { |newct| old_ctedges.all? { |oldct| (newct & oldct).empty? } }
          end

          def old_paths_are_preserved(old_paths, new_paths)
            # if gray phase, towns can be upgraded or downgraded
            # and there are no tiles mixed with towns and other things
            # so if it is gray phase, and the tile has towns, then we only need
            # to test that exits are preserved
            old_exits = old_paths.flat_map(&:exits).uniq
            new_exits = new_paths.flat_map(&:exits).uniq
            return (old_exits - new_exits).empty? if @game.gray_phase? && old_paths.any?(&:town)

            old_paths.all? { |path| new_paths.any? { |p| path <= p } }
          end

          def process_lay_tile(action)
            if action.hex.id == 'I12' && !@game.wsrc.closed?
              # Kitchener got laid so the lay tile bonus for the private is no longer needed

              tile_lay = @game.abilities(@game.wsrc, :tile_lay)
              @game.wsrc.remove_ability(tile_lay) if tile_lay
            end

            super
            # TODO: Replace 'true' with @loading check & implement auto action usage
            # @game.destination_check! # if true
          end
        end
      end
    end
  end
end

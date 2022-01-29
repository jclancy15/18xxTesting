# frozen_string_literal: true

require_relative '../../../round/operating'

module Engine
  module Game
    module G1866
      module Round
        class Operating < Engine::Round::Operating
          def initialize(game, steps, **opts)
            super

            @entities_orginal = @entities.map { |c| map_corporation(c) }
          end

          def force_next_entity!
            entity = current_entity
            check_operating_order!
            super

            # If we have sold the stock turn token, close the corporation after we are done with all the actions
            entity.close! if @game.stock_turn_token_removed?(entity)
          end

          def next_entity!
            after_operating(@entities[@entity_index])
            super
          end

          def start_operating
            entity = @entities[@entity_index]
            if @game.major_national_corporation?(entity) && entity.num_player_shares.zero?
              @log << "#{entity.name} operates without any president"

              current_price = entity.share_price.price
              if @game.national_upgraded?(entity)
                @game.stock_market.move_right(entity)
              else
                @game.stock_market.move_left(entity)
              end

              @log << "#{entity.name}'s share price changes from #{@game.format_currency(current_price)} "\
                      "to #{@game.format_currency(entity.share_price.price)}"

              next_entity!
            else
              super
            end
          end

          def after_operating(entity)
            if !entity.corporation? || !@game.corporation?(entity) || !@game.game_end_triggered? ||
              (@game.game_end_triggered_corporation == entity && @game.game_end_triggered_round == @round_num)
              return
            end

            @game.corporation_game_end_operated(entity)
          end

          def check_operating_order!
            # When we are forcing the next entity to operate, make sure the operating order is correct first
            new_entities = select_entities.reject do |c|
              @game.minor_national_corporation?(c) || @entities_orginal.find { |e| e[:id] == c.id }
            end
            return if new_entities.empty?

            find_entity = current_entity
            new_entities.each do |c|
              index = @entities_orginal.size
              @entities_orginal.each_with_index do |e, idx|
                next if e[:type] == 'minor_national'

                if @game.germany_or_italy_national?(c)
                  index = idx
                  break
                end
                next if e[:price] > c.share_price.price
                next if e[:price] == c.share_price.price && e[:row] <= c.share_price.coordinates[0]

                index = idx
                break
              end
              @entities.insert(index, c)
              @entities_orginal.insert(index, map_corporation(c))
            end

            goto_entity!(find_entity)
          end

          def map_corporation(corporation)
            {
              id: corporation.id,
              type: corporation.type,
              price: corporation.share_price.price,
              row: corporation.share_price.coordinates[0],
            }
          end
        end
      end
    end
  end
end

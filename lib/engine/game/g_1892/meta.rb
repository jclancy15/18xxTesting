# frozen_string_literal: true

require_relative '../meta'

module Engine
  module Game
    module G1892
      module Meta
        include Game::Meta

        DEV_STAGE = :production

        GAME_SUBTITLE = 'Palestine'
        GAME_DESIGNER = 'Joe Clancy'
        GAME_LOCATION = 'Palestine'
        GAME_PUBLISHER = 'Web Published'
        GAME_RULES_URL = 'N/a'
        GAME_INFO_URL = 'N/a'

        PLAYER_RANGE = [1, 6].freeze
        OPTIONAL_RULES = [
          {
            sym: :multiple_brown_from_ipo,
            short_name: 'Buy Multiple Brown Shares From IPO',
            desc: 'Multiple brown shares may be bought from IPO as well as from pool',
          },
          {
            sym: :optional_6_train,
            short_name: 'Optional extra 6-Train',
            desc: 'Adds a 3rd 6-train',
          },
        ].freeze
      end
    end
  end
end

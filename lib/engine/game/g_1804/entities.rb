# frozen_string_literal: true

module Engine
  module Game
    module G1804
      module Entities
       COMPANIES = [
          {
            name: 'Book Deal',
            sym: 'BD',
            value: 20,
            revenue: 5,
            desc: 'No special abilities.',
            color: nil,
          },
          {
            name: 'Vox Media',
            sym: 'VM',
            value: 40,
            desc: "A campaign owning the VM may lay a tile on VM's hex even if this hex is not connected"\
                  " to the campaigns's track. This free tile placement is in addition to the campaign's normal tile"\
                  ' placement. Blocks C12 while owned by a player.',
            abilities: [{ type: 'blocks_hexes', owner_type: 'player', hexes: ['C12'] },
                        {
                          type: 'tile_lay',
                          owner_type: 'corporation',
                          hexes: ['C12'],
                          tiles: %w[3 4 58],
                          when: 'owning_corp_or_turn',
                          count: 1,
                        }],
            color: nil,
          },
          {
            name: 'Cessna Lease',
            sym: 'CL',
            value: 75,
            revenue: 15,
            desc: 'A campaign owning the CL may place a tile and station token in the CL hex G10 for only the $120'\
                  " cost of the mountain. The station does not have to be connected to the remainder of the corporation's"\
                  " route. The tile laid is the owning campaign's one tile placement for the turn. The hex must be empty"\
                  ' to use this ability. Blocks G10 while owned by a player.',
            abilities: [{ type: 'blocks_hexes', owner_type: 'player', hexes: ['G10'] },
                        {
                          type: 'teleport',
                          owner_type: 'corporation',
                          tiles: ['57'],
                          hexes: ['G10'],
                        }],
            color: nil,
          },
 {
            name: 'Ankara Penthouse',
            sym: 'AP',
            value: 110,
            revenue: 20,
            desc: 'A campaign owning the AP may exchange it for a 10% share of the NYC if they do not already hold 60%'\
                  ' of the NYC and there is NYC stock available in the Bank or the Pool. The exchange may be made during'\
                  " the player's turn of a stock round or between the turns of other players or corporations in either "\
                  'stock or operating rounds. This action closes the MH.',
            abilities: ,
            color: nil,
          },
         
          {
            name: 'Black, Manafort, Stone, and Kelly',
            sym: 'BSMK',
            value: 160,
            revenue: 25,
            desc: 'The initial purchaser of the BSMK immediately receives a 10% share of HW stock without further'\
                  ' payment. This action does not close the BSMK. The HW corporation will not be running at this point,'\
                  ' but the stock may be retained or sold subject to the ordinary rules of the game.'\
                  ' Blocks H18 while owned by a player.',
            abilities: [{ type: 'shares', shares: 'HW_1' }],
            color: nil,
          },
          {
            name: 'Independent News Network',
            sym: 'INN',
            value: 220,
            revenue: 25,
            desc: "The owner of the INN private company immediately receives the campaign advisor's note of the"\
                  ' David Tusk (DT) campaign without further payment. The INN private company may not be sold to any corporation, and does'\
                  ' not exchange hands if the owning player loses the campaign advisor note of the DT.'\
                  ' When the DT campaign purchases its first marketing team the private company is closed.',
            abilities: [{ type: 'close', when: 'bought_train', corporation: 'DT' },
                        { type: 'no_buy' },
                        { type: 'shares', shares: 'DT_0' }],
            color: nil,
          },
        ].freeze

        CORPORATIONS = [
          {
            float_percent: 60,
            sym: 'AC',
            name: 'Amanda Clarke',
            logo: '1804/AC.alt',
            simple_logo: '1804/AC.alt',
            tokens: [0, 40, 100],
            coordinates: ['G12'],
            color: :'#ADD8E6',
            text_color: 'black',
          },
          {
            float_percent: 60,
            sym: 'BS',
            name: 'Barry Stein',
            logo: '1804/BS.alt',
            simple_logo: '1804/BS.alt',
            tokens: [0, 40, 100],
            coordinates: ['E2'],
            color: :'#32763f',
          },
          {
            float_percent: 60,
            sym: 'CK',
            name: 'Charlotte Kim',
            logo: '1804/CK.alt',
            simple_logo: '1804/CK.alt',
            tokens: [0, 40, 100],
            coordinates: ['B11'],
            color: :'#474548',
          },
          {
            float_percent: 60,
            sym: 'DT',
            name: 'David Tusk',
            logo: '1804/DT.alt',
            simple_logo: '1804/DT.alt',
            tokens: [0, 40, 100],
            coordinates: ['J7'],
            color: '#d1232a',
          },
          {
            float_percent: 60,
            sym: 'ES',
            name: 'Emily Snyder',
            logo: '1804/ES.alt',
            simple_logo: '1804/ES.alt',
            tokens: [0, 40, 100],
            coordinates: ['D7'],
            color: '#025aaa',
          },
          {
            float_percent: 60,
            sym: 'FA',
            name: 'Firoz Anand',
            logo: '1804/FA.alt',
            simple_logo: '1804/FA.alt',
            tokens: [0, 40, 100],
            coordinates: ['I16'],
            color: :'#FFF500',
            text_color: 'black',
          },
          {
            float_percent: 60,
            sym: 'GP',
            name: 'Greg Pope',
            logo: '1804/GP.alt',
            simple_logo: '1804/GP.alt',
            tokens: [0, 40, 100],
            coordinates: ['J13'],
            color: :'#d88e39',
          },
          {
            float_percent: 60,
            sym: 'HW',
            name: 'Henry Washington',
            logo: '1804/HW.alt',
            simple_logo: '1804/HW.alt',
            tokens: [0, 40, 100],
            coordinates: ['F7'],
            color: :'#95c054',
          },
        ].freeze
      end
    end
  end
end

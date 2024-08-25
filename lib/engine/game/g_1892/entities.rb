# frozen_string_literal: true

module Engine
  module Game
    module G1892
      module Entities
        COMPANIES = [
          {
            name: 'Palestine Electric Corporation',
            sym: 'PEC',
            value: 20,
            revenue: 5,
            desc: 'No special abilities.',
            color: nil,
          },
          {
            name: 'Parisian Company for Public Works and Construction',
            sym: 'PCPWC',
            value: 40,
            revenue: 10,
            desc: "A corporation owning the PCPWC may lay a yellow gentle curve tile. Placement counts as normal tile lay. ',
            color: nil,
          },
          {
            name: 'Hejaz Railway Central Committee',
            sym: 'HRCC',
            value: 70,
            revenue: 15,
            desc: 'Owning corporation receives $40 after laying a yellow tile in a '\
                  'mountain hex.  Any fees must be paid first.',
          abilities: [
            {
              type: 'tile_income',
              income: 40,
              terrain: 'mountain',
              owner_type: 'corporation',
              owner_only: true,
            },
          ],
          color: nil,
          },
          {
            name: 'Ziraat Bank Stake',
            sym: 'ZBS',
            value: 150,
            revenue: 20,
            desc: 'The initial purchaser of the ZBS immediately receives a 10% share of OR stock without further'\
                  ' payment. This action does not close the ZBS. The ORR corporation will not be running at this point,'\
                  ' but the stock may be retained or sold subject to the ordinary rules of the game.',
            abilities: [{ type: 'shares', shares: 'ORR_1' }],
            color: nil,
          },
          {
            name: 'Jezreel Valley Railway',
            sym: 'JV',
            value: 180,
            revenue: 25,
            desc: 'The owner of the JV private company immediately receives the President's certificate of the'\
                  ' JVR without further payment. The JV private company may not be sold to any corporation, and does'\
                  ' not exchange hands if the owning player loses the Presidency of the JVR.'\
                  ' When the JVR purchases its first train the private company is closed.',
            abilities: [{ type: 'close', when: 'bought_train', corporation: 'JVR' },
                        { type: 'no_buy' },
                        { type: 'shares', shares: 'JVR_0' }],
            color: nil,
          },
        ].freeze

        CORPORATIONS = [
          {
            float_percent: 60,
            sym: 'J&J',
            name: 'Jaffa-Jerusalem Railroad',
            logo: '1892/J&J.alt',
            simple_logo: '1892/J&J.alt',
            tokens: [0, 40, 100],
            coordinates: 'H13',
            color: '#32763f',
          },
          {
            float_percent: 60,
            sym: 'OR',
            name: 'Ottoman Railroad',
            logo: '1892/OR.alt',
            simple_logo: '1892/OR.alt',
            tokens: [0, 40, 100],
            coordinates: 'O6',
            color: :'#474548',
          },
          {
            float_percent: 60,
            sym: 'PR',
            name: 'Palestine Railroad',
            logo: '1892/PR.alt',
            simple_logo: '1892/PR.alt',
            tokens: [0, 40, 100],
            coordinates: 'C12',
            color: '#d1232a',
          },
          {
            float_percent: 60,
            sym: 'JVR',
            name: 'Jezreel Valley Railroad',
            logo: '1892/JVR.alt',
            simple_logo: '1892/JVR.alt',
            tokens: [0, 40, 100],
            coordinates: 'F13',
            color: '#025aaa',
          },
          {
            float_percent: 60,
            sym: 'SMR',
            name: 'Sinai Military Railroad',
            logo: '1892/SMR.alt',
            simple_logo: '1892/SMR.alt',
            tokens: [0, 40, 100],
            coordinates: 'L3',
            color: :'#ADD8E6',
            text_color: 'black',
          },
          {
            float_percent: 60,
            sym: 'HJR',
            name: 'Hejaz Jordan Railroad',
            logo: '1892/HJR.alt',
            simple_logo: '1892/HJR.alt',
            tokens: [0, 40, 100],
            coordinates: 'C16',
            color: :'#FFF500',
            text_color: 'black',
          },
        ].freeze
      end
    end
  end
end

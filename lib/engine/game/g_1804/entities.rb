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
            name: 'Cessna Lease',
            sym: 'CL',
            value: 50,
            revenue: 10,
            desc: 'Owning campaign does not receive revenue, but may travel 2 spaces instead of 1 during the Campaign Round.',
            color: nil,
          },
          {
            name: 'Vox Media',
            sym: 'VM',
            value: 120,
            revenue: 20,
            desc: 'Owning campaign receives +$10 on routes with Progressive Caucus.',
              abilities: [
              {
                type: 'hex_bonus',
                owner_type: 'corporation',
                hexes: ['B7'],
                amount: 10,
              }],
            color: nil,
          },
          {
            name: 'Black, Manafort, Stone, and Kelly',
            sym: 'BSMK',
            value: 160,
            revenue: 15,
            desc: 'The purchasing player receives 10% influence with a Republican (AC, DT, FA, or GP) campaign randomly selected at the start of the game.',
            abilities: [
              {
                type: 'shares',
                shares: 'random_share',
                corporations: %w[AC DT FA GP],
              }],
            color: nil,
          },
          {
            name: 'DNC Chairman',
            sym: 'DNCC',
            value: 195,
            revenue: 25,
            desc: "The owner of the DNCC private company immediately receives the campaign advisor's note of the"\
                  ' Emily Snyder (ES) campaign without further payment. The DNCC private company may not be sold to any corporation, and does'\
                  ' not exchange hands if the owning player loses the campaign advisor note of the ES.'\
                  ' When the ES campaign purchases its first marketing team the private company is closed.',
            abilities: [{ type: 'close', when: 'bought_train', corporation: 'ES' },
                        { type: 'no_buy' },
                        { type: 'shares', shares: 'ES_0' }],
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
            coordinates: 'G12',
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
            coordinates: 'E2',
            color: :'#32763f',
          },
          {
            float_percent: 60,
            sym: 'CK',
            name: 'Charlotte Kim',
            logo: '1804/CK.alt',
            simple_logo: '1804/CK.alt',
            tokens: [0, 40, 100],
            coordinates: 'B11',
            color: :'#474548',
          },
          {
            float_percent: 60,
            sym: 'DT',
            name: 'David Tusk',
            logo: '1804/DT.alt',
            simple_logo: '1804/DT.alt',
            tokens: [0, 40, 100],
            coordinates: 'J7',
            color: '#d1232a',
          },
          {
            float_percent: 60,
            sym: 'ES',
            name: 'Emily Snyder',
            logo: '1804/ES.alt',
            simple_logo: '1804/ES.alt',
            tokens: [0, 40, 100],
            coordinates: 'D7',
            color: '#025aaa',
          },
          {
            float_percent: 60,
            sym: 'FA',
            name: 'Firoz Anand',
            logo: '1804/FA.alt',
            simple_logo: '1804/FA.alt',
            tokens: [0, 40, 100],
            coordinates: 'I16',
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
            coordinates: 'J13',
            color: :'#d88e39',
          },
          {
            float_percent: 60,
            sym: 'HW',
            name: 'Henry Washington',
            logo: '1804/HW.alt',
            simple_logo: '1804/HW.alt',
            tokens: [0, 40, 100],
            coordinates: 'F7',
            color: :'#95c054',
          },
        ].freeze
      end
    end
  end
end

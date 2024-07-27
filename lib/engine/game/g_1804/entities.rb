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
            desc: '"The purchasing player receives 10% influence with a Republican (AC, DT, FA, or GP) campaign randomly selected at the start of the game.',
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
                  ' When the B&O purchases its first train the private company is closed.',
            abilities: [{ type: 'close', when: 'bought_train', corporation: 'ES' },
                        { type: 'no_buy' },
                        { type: 'shares', shares: 'ES_0' }],
            color: nil,
          },
        ].freeze

        CORPORATIONS = [
          {
            float_percent: 60,
            sym: 'PRR',
            name: 'Pennsylvania Railroad',
            logo: '18_chesapeake/PRR',
            simple_logo: '1830/PRR.alt',
            tokens: [0, 40, 100, 100],
            coordinates: 'H12',
            color: '#32763f',
          },
          {
            float_percent: 60,
            sym: 'NYC',
            name: 'New York Central Railroad',
            logo: '1830/NYC',
            simple_logo: '1830/NYC.alt',
            tokens: [0, 40, 100, 100],
            coordinates: 'E19',
            color: :'#474548',
          },
          {
            float_percent: 60,
            sym: 'CPR',
            name: 'Canadian Pacific Railroad',
            logo: '1830/CPR',
            simple_logo: '1830/CPR.alt',
            tokens: [0, 40, 100, 100],
            coordinates: 'A19',
            color: '#d1232a',
          },
          {
            float_percent: 60,
            sym: 'B&O',
            name: 'Baltimore & Ohio Railroad',
            logo: '18_chesapeake/BO',
            simple_logo: '1830/BO.alt',
            tokens: [0, 40, 100],
            coordinates: 'I15',
            color: '#025aaa',
          },
          {
            float_percent: 60,
            sym: 'C&O',
            name: 'Chesapeake & Ohio Railroad',
            logo: '18_chesapeake/CO',
            simple_logo: '1830/CO.alt',
            tokens: [0, 40, 100],
            coordinates: 'F6',
            color: :'#ADD8E6',
            text_color: 'black',
          },
          {
            float_percent: 60,
            sym: 'ERIE',
            name: 'Erie Railroad',
            logo: '1846/ERIE',
            simple_logo: '1830/ERIE.alt',
            tokens: [0, 40, 100],
            coordinates: 'E11',
            color: :'#FFF500',
            text_color: 'black',
          },
          {
            float_percent: 60,
            sym: 'NYNH',
            name: 'New York, New Haven & Hartford Railroad',
            logo: '1830/NYNH',
            simple_logo: '1830/NYNH.alt',
            tokens: [0, 40],
            coordinates: 'G19',
            city: 0,
            color: :'#d88e39',
          },
          {
            float_percent: 60,
            sym: 'B&M',
            name: 'Boston & Maine Railroad',
            logo: '1830/BM',
            simple_logo: '1830/BM.alt',
            tokens: [0, 40],
            coordinates: 'E23',
            color: :'#95c054',
          },
        ].freeze
      end
    end
  end
end

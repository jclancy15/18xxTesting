# frozen_string_literal: true

module Engine
  module Game
    module G1804
      module Map
       TILES = {
          '3' => 2,
          '4' => 2,
          '7' => 'unlimited',
          '8' => 'unlimited',
          '9' => 'unlimited',
          '14' => 3,
          '15' => 3,
          '16' => 'unlimited',
          '17' => 'unlimited',
          '18' => 'unlimited',
          '19' => 'unlimited',
          '20' => 'unlimited',
          '21' => 'unlimited',
          '22' => 'unlimited',
          '23' => 'unlimited',
          '24' => 'unlimited',
          '28' => 'unlimited',
          '29' => 'unlimited',
          '39' => 'unlimited',
          '43' => 'unlimited',
          '47' => 'unlimited',
          '53' => 1,
          '54' => 1,
          '57' => 6,
          '58' => 2,
          '59' => 1,
          '61' => 1,
          '62' => 1,
          '64' => 1,
          '65' => 1,
          '66' => 1,
          '67' => 1,
          '68' => 1,
          '611' => 4,
          '625' => 'unlimited',
          '626' => 'unlimited',
          '1804_1' =>
          {
            'count' => 1,
            'color' => 'yellow',
            'code' =>
            'city=revenue:30,slots:1;path=a:0,b:_0;path=a:4,b:_0;label=B',
          },
        }.freeze

      LOCATION_NAMES = {
          'A10' => 'Philanthropy Class',
          'B3' => 'Hollywood',
          'B7' => 'Progressive Caucus',
          'B11' => 'New Democrats',
          'B13' => 'Wonk Blogs',
          'C4' => 'Socialists',
          'C10' => 'Technocrats',
          'C14' => 'Silicon Valley',
          'D1' => 'Influencers',
          'D7' => 'Liberals',
          'E2' => 'Populist Left',
          'E10' => 'Blue Dog Coalition',
          'F7' => 'Black Caucus',
          'F9' => 'Problem Solvers Caucus',
          'F15' => 'Chamber of Commerce',
          'G4' => 'Labor Unions',
          'G12' => 'Main Street Caucus',
          'G14' => 'Libertarian Party',
          'G18' => 'Wall Street',
          'H11' => 'Republican Governance Group',
          'H15' => 'Neoconservatives',
          'I10' => 'Republican Study Committee',
          'I16' => 'Liberty Caucus',
          'I18' => 'Crypto Whales',
          'J7' => 'Populist Right & Nationalists',
          'J13' => 'Freedom Caucus',
          'K14' => 'Evangelicals',

          'M9' => 'Rust Belt',
          'M13' => 'New England',
          'N6' => 'Mountain States',
          'N8' => 'Midwest',
          'N10' => 'Appalachia',
          'N12' => 'Mid-Atlantic',
          'O5' => 'Pacific States & Territories',
          'O7' => 'Texas & Desert States',
          'O9' => 'Deep South',
          'O11' => 'Carolinas',
        }.freeze

        HEXES = {
          red: {
            ['A8'] =>
                     'offboard=revenue:yellow_20|brown_50,hide:1,groups:Philanthropy;path=a:0,b:_0;border=edge:4',
            ['A10'] =>
                     'offboard=revenue:yellow_20|brown_50,groups:Philanthropy;path=a:0,b:_0',
            ['A12'] =>
                     'offboard=revenue:yellow_20|brown_50,hide:1,groups:Philanthropy;path=a:0,b:_0;border=edge:1',        
            ['B3'] =>
                   'offboard=revenue:yellow_30|brown_60;path=a:0,b:_0;path=a:5,b:_0',
            ['C14'] =>
                   'offboard=revenue:yellow_20|brown_40;path=a:0,b:_0;path=a:1,b:_0',
            ['F15'] =>
                   'offboard=revenue:yellow_30|brown_50;path=a:0,b:_0;path=a:1,b:_0',
            ['G4'] =>
                   'offboard=revenue:yellow_20|green_30;path=a:2,b:_0;path=a:4,b:_0',
            ['G18'] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:0,b:_0;path=a:1,b:_0',
            ['K14'] => 'offboard=revenue:yellow_10|brown_40;path=a:1,b:_0;path=a:3,b:_0',
          },

          white: {
            %w[C4 E10 H11 G14] => 'town',
            ['C10'] => 'city=revenue:0;upgrade=cost:120,terrain:mountain',
            %w[E12 F11 F13 G6 G10 H7] => 'upgrade=cost:80,terrain:mountain',
            ['J9'] => 'upgrade=cost:120,terrain:mountain',
            ['G8'] => 'upgrade=cost:160,terrain:mountain',
            %w[B7 B11 E2 F7 G12 I8 I10 I16 J13 H15] => 'city',
            %w[B9 C6 C8 C12 D3 D5 D9 D11 E4 E6 E8 F3 F5 G16 H9 H13 H17 I12 I14 J11 J15 K8 K10 K12] => 'blank',
            ['D7'] => 'city=revenue:0;label=B',

            ['M13'] => 'city=revenue:yellow_30|,slots:8;path=a:0,b:_0,terminal:1',
            ['N6'] => 'city=revenue:yellow_30|,slots:8;path=a:0,b:_0,terminal:1;path=a:4,b:_0,terminal:1path=a:5,b:_0,terminal:1',
            ['N8'] => 'city=revenue:yellow_30|,slots:8;path=a:0,b:_0,terminal:1;path=a:0,b:_0,terminal:1;path=a:1,b:_0,terminal:1;path=a:3,b:_0,terminal:1;path=a:4,b:_0,terminal:1;path=a:5,b:_0,terminal:1',
            ['O11'] => 'city=revenue:yellow_30|,slots:8;path=a:1,b:_0,terminal:1;path=a:2,b:_0,terminal:1;path=a:3,b:_0,terminal:1',
            ['M9'] => 'city=revenue:yellow_10|green_20|brown_50,slots:8;path=a:0,b:_0,terminal:1;path=a:5,b:_0,terminal:1',
            ['N10'] => 'city=revenue:yellow_10|green_20|brown_50,slots:8;path=a:0,b:_0,terminal:1;path=a:0,b:_0,terminal:1;path=a:1,b:_0,terminal:1;path=a:2,b:_0,terminal:1;path=a:4,b:_0,terminal:1;path=a:5,b:_0,terminal:1',
            ['N12'] => 'city=revenue:yellow_10|green_20|brown_50,slots:8;path=a:0,b:_0,terminal:1;path=a:1,b:_0,terminal:1;path=a:3,b:_0,terminal:1',
            ['O9'] => 'city=revenue:yellow_10|green_20|brown_50,slots:8;path=a:1,b:_0,terminal:1;path=a:2,b:_0,terminal:1;path=a:3,b:_0,terminal:1;path=a:4,b:_0,terminal:1',
            ['O5'] => 'city=revenue:yellow_10|green_60,slots:8;path=a:3,b:_0,terminal:1;path=a:4,b:_0,terminal:1',
            ['O7'] => 'city=revenue:yellow_10|green_50,slots:8;path=a:1,b:_0,terminal:1;path=a:2,b:_0,terminal:1;path=a:3,b:_0,terminal:1;path=a:4,b:_0,terminal:1',
          },

          gray: {
            %w[B13 I18] => 'town=revenue:10;path=a:0,b:_0;path=a:1,b:_0',
            ['D1'] => 'town=revenue:10;path=a:3,b:_0;path=a:5,b:_0',
            %w[G2 J17] => 'path=a:2,b:3',
            %w[F1 I6] => 'path=a:3,b:5',
            ['B5'] => 'path=a:0,b:4',
            ['D13'] => 'path=a:0,b:3',
            ['C2'] =>'path=a:3,b:0;path=a:3,b:5',
          },

          yellow: {
            ['F9'] => 'city=revenue:0;city=revenue:0;label=OO;upgrade=cost:80,terrain:mountain',
            ['J7'] => 'city=revenue:40;city=revenue:40;path=a:2,b:_0;path=a:5,b:_1;label=NY;upgrade=cost:80,terrain:mountain',
          },
          
        }.freeze
        LAYOUT = :pointy
      end
    end
  end
end

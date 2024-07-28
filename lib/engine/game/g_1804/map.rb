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
          gray: {
            %w[B13 I18] => 'town=revenue:10;path=a:0,b:_0;path=a:1,b:_0',
            ['D1'] => 'town=revenue:10;path=a:3,b:_0;path=a:5,b:_0',
            %w[G2 J17] => 'path=a:2,b:3',
            %w[F1 I6] => 'path=a:3,b:5',
            ['B5'] => 'path=a:0,b:4',
            ['D13'] => 'path=a:0,b:3',
            ['C2'] => 'path=a:0,b:3; path=a:3,b:5',
          },
          white: {
            %w[F4 J14 F22] => 'city=revenue:0;upgrade=cost:80,terrain:water',
            ['E7'] => 'town=revenue:0;border=edge:5,type:impassable',
            ['F8'] => 'border=edge:2,type:impassable',
            ['C11'] => 'border=edge:5,type:impassable',
            ['C13'] => 'border=edge:0,type:impassable',
            ['D12'] => 'border=edge:2,type:impassable;border=edge:3,type:impassable',
            ['B16'] => 'city=revenue:0;border=edge:5,type:impassable',
            ['C17'] => 'upgrade=cost:120,terrain:mountain;border=edge:2,type:impassable',
            %w[B20 D4 F10] => 'town',
            %w[I13
               D18
               B12
               B14
               B22
               C7
               C9
               C23
               D8
               D16
               D20
               E3
               E13
               E15
               F12
               F14
               F18
               G3
               G5
               G9
               G11
               H2
               H6
               H8
               H14
               I3
               I5
               I7
               I9
               J4
               J6
               J8] => 'blank',
            %w[G15 C21 D22 E17 E21 G13 I11 J10 J12] =>
            'upgrade=cost:120,terrain:mountain',
            %w[E19 H4 B10 H10 H16] => 'city',
            ['F16'] => 'city=revenue:0;upgrade=cost:120,terrain:mountain',
            %w[G7 G17 F20] => 'town=revenue:0;town=revenue:0',
            %w[D6 I17 B18 C19] => 'upgrade=cost:80,terrain:water',
          },
          yellow: {
            %w[E5 D10] =>
                     'city=revenue:0;city=revenue:0;label=OO;upgrade=cost:80,terrain:water',
            %w[E11 H18] => 'city=revenue:0;city=revenue:0;label=OO',
            ['I15'] => 'city=revenue:30;path=a:4,b:_0;path=a:0,b:_0;label=B',
            ['G19'] =>
            'city=revenue:40;city=revenue:40;path=a:3,b:_0;path=a:0,b:_1;label=NY;upgrade=cost:80,terrain:water',
            ['E23'] => 'city=revenue:30;path=a:3,b:_0;path=a:5,b:_0;label=B',
          },
        }.freeze

        LAYOUT = :pointy
      end
    end
  end
end

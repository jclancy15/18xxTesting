# frozen_string_literal: true

module Engine
  module Game
    module G1892
      module Map
        TILES = {
          '1' => 1,
          '2' => 1,
          '3' => 2,
          '4' => 2,
          '7' => 10,
          '8' => 1,
          '9' => 10,
          '14' => 3,
          '15' => 2,
          '18' => 2,
          '20' => 3,
          '26' => 2,
          '27' => 2,
          '44' => 2,
          '55' => 1,
          '56' => 1, 
          '57' => 4,
          '58' => 2,
          '59' => 2,
          '63' => 2,
          '64' => 1,
          '65' => 1,
          '66' => 1,
          '67' => 1,
          '68' => 1,
          '69' => 1,
          '70' => 1,
          '624' => 1,
          '625' => 1,
          '626' => 1,
          '627' => 2,
          '780' => 2,
          '781' => 2,
          '798' => 2,
          '9201' => {
            'count' => 6,
            'color' => 'green',
            'code' => 'town=revenue:0;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
          '9202' => {
            'count' => 6,
            'color' => 'brown',
            'code' => 'town=revenue:0;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0',
        }.freeze

        LOCATION_NAMES = {
          'A14' => 'Lebanon',
          'C12' => 'Acre',
          'C16' => 'Safed',
          'D11' => 'Haifa',
          'E16' => 'Tiberias',
          'E18' => 'Syria',
          'F7' => 'Europe',
          'F13' => 'Nazareth',
          'G8' => 'Tel-Aviv & Jaffa',
          'G12' => 'Jenin',
          'H13' => 'Nablus',
          'I10' => 'Lydda',
          'J15' => 'Jordan',
          'K4' => 'Ashkelon',
          'K10' => 'Jerusalem',
          'L3' => 'Gaza',
          'L9' => 'Bethlehem',
          'M2' => 'Khan Yunis',
          'M8' => 'Hebron',
          'N1' => 'Egypt',
          'O6' => 'Beersheba',
          'S8' => 'Saudi Arabia',
        }.freeze

        HEXES = {
          red: {
            ['A14'] =>
                     'offboard=revenue:yellow_30|brown_60;path=a:5,b:_0;path=a:0,b:_0',
            ['E18'] =>
                   'offboard=revenue:yellow_40|brown_60;path=a:1,b:_0;path=a:2,b:_0',
            ['F7'] =>
                   'offboard=revenue:yellow_30|brown_50;path=a:4,b:_0;path=a:5,b:_0',
            ['J15'] =>
                   'offboard=revenue:yellow_30|brown_50;path=a:1,b:_0;path=a:2,b:_0',
            ['N1'] =>
                   'offboard=revenue:yellow_20|brown_30;path=a:3,b:_0;path=a:4,b:_0',
            ['S8'] => 'offboard=revenue:yellow_20|brown_70;path=a:2,b:_0',
          },
          white: {
            %w[M4 N3 N5 O4] => 'blank',
            %w[D15 D17 E14 E18 F15 J9 J11 K8 K12 L11 P5 P7 Q6] => 'upgrade=cost:120,terrain:mountain',
            %w[B13 B15 C14 D13 E10 E12 F9 F11 G10 G14 H7 H9 H11 H15 I6 I8 I12 I14 J5 J7 J13 K6 L5 L7 M4 M6 M 10 M12 N5 N7 N9 N11 O8 O10 P9 Q8 R7] =>
            'upgrade=cost:40,terrain:mountain',
            %w[D11 E16 K4 M2] => 'town',
            %w[G12 I10 L9] => 'town=revenue:0;town=revenue:0',
            %w[C12 C16 F13 H13 L3 M8 O6] => 'city',
          },
          yellow: {
            ['K10'] =>
                     'city=revenue:0;city=revenue:0;label=OO;upgrade=cost:120,terrain:mountain',
            ['G8'] =>
                     'city=revenue:0;city=revenue:0;label=OO;upgrade=cost:40,terrain:mountain',
          },
        }.freeze

        LAYOUT = :pointy
      end
    end
  end
end

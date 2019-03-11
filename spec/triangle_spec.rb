require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do
  specify { expect(Triangle.positive_integer?("1")).to eq true }
  specify { expect(Triangle.positive_integer?(nil)).to eq false }
  specify { expect(Triangle.positive_integer?("-1")).to eq false }
  specify { expect(Triangle.positive_integer?("0")).to eq false }

  specify { expect(Triangle.sorted_sides(["10", "10", "10"])).to eq [10, 10, 10]}
  specify { expect(Triangle.sorted_sides(["10", "15", "15"])).to eq [10, 15, 15] }
  specify { expect(Triangle.sorted_sides(["5", "4", "3"])).to eq [3, 4, 5] }

  specify { expect(Triangle.sorted_sides(["1", "2"])).to eq nil }
  specify { expect(Triangle.sorted_sides(["-1", "2", "3"])).to eq nil }
  specify { expect(Triangle.sorted_sides(["5", "1", "2"])).to eq nil }

  specify { expect(Triangle.inspect(["1", "2"])).to eq NOT_A_TRIANGLE }
  specify { expect(Triangle.inspect(["1", "0", "1"])).to eq NOT_A_TRIANGLE }
  specify { expect(Triangle.inspect(["1", "1", "1"])).to eq EQUILATERAL_TRIANGLE }
  specify { expect(Triangle.inspect(["2", "1", "2"])).to eq ISOSCELES_TRIANGLE }
  specify { expect(Triangle.inspect(["3", "4", "5"])).to eq SCALENE_TRIANGLE }
end


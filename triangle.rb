SCALENE_TRIANGLE = '不等辺三角形ですね！'
ISOSCELES_TRIANGLE = '二等辺三角形ですね！'
EQUILATERAL_TRIANGLE = '正三角形ですね！'
NOT_A_TRIANGLE = '三角形じゃないです＞＜'

class Triangle
  def self.inspect(sides)
    sides = sorted_sides(sides)
    return NOT_A_TRIANGLE unless sides
    return EQUILATERAL_TRIANGLE if sides.uniq.count == 1
    return ISOSCELES_TRIANGLE if sides.uniq.count == 2
    SCALENE_TRIANGLE
  end

  def self.sorted_sides(sides)
    return nil unless sides.size == 3
    return nil unless sides.all? { |s| positive_integer?(s) }

    sides = sides.map { |s| Integer(s) }.sort
    return nil unless (sides[0] + sides[1]) > sides[2]
    sides
  end

  def self.positive_integer?(value)
    Integer(value) > 0
  rescue
    false
  end
end

if $0 == __FILE__
  args = ARGV.join.split(',')
  p Triangle.inspect(args)
end

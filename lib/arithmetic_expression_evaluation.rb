class Evaluate
  def initialize(exp)
    @operators = []
    @operands = []
    evaluate exp
    print_result
  end

  def evaluate(exp)
    exp.split(' ').each { |s| handle s }
  end

  def handle(s)
    return if s == '('
    return push_operand(calculate(@operators.pop, @operands.pop)) if s == ')'
    return push_operator(s) if is_operator? s
    push_operand(s.to_f)
  end

  def push_operator(operator)
    @operators.push operator
  end

  def push_operand(operand)
    @operands.push operand
  end

  def is_operator?(s)
    ['+', '-', '*', '/',].include? s
  end

  def calculate(operator, operand)
    return @operands.pop + operand if operator == '+'
    return @operands.pop * operand if operator == '*'
    return @operands.pop - operand if operator == '-'
    return @operands.pop / operand if operator == '/'
  end

  def print_result
    puts @operands.push
  end
end

# Evaluate.new('  ( 1 * ( ( 2 + 3 ) * ( 4 * 5 ) ) )  '.strip)
Evaluate.new($stdin.gets.strip)

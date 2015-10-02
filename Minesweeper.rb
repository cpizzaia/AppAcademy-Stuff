require_relative 'Board'

x = Board.new(20, 50)
x.render
while true
  x.select_square
end

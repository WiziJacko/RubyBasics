# Заполнить массив числами фибоначчи до 100

fib = []
fib << 0
fib << 1

until fib[-1] + fib[-2] > 100
  fib << fib[-1] + fib[-2]
end

puts fib

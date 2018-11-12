# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. 

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
leap = "не високосный"

print "Введите год: "
year = gets.to_i

if year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
  months[1] = 29
  leap = "високосный"
end

print "Введите день: "
day = gets.to_i
print "Введите порядковый номер месяца: "
month = gets.to_i

if month > 12 || month < 1
  puts "!!! Введен некорректный порядковый номер месяца !!!"
  exit
end

if day > months[month - 1] || day <= 0
  puts "!!! Введен некорректный день месяца !!!"
  exit
end

date_number = day

if month > 1
  date_number += months.take(month - 1).sum
end

puts "Порядковый номер даты: #{date_number}. (Год #{leap})"

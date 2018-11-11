# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ('а'..'я').to_a
alphabet.insert(6, 'ё')
vowels_arr = ['а', 'е', 'ё', 'и', 'о', 'у', 'ы', 'э', 'ю', 'я']
vowels_hash = {}

alphabet.each_with_index do |value, index|
  if vowels_arr.include?(alphabet[index])
    vowels_hash[value] = index + 1
  end
end

puts vowels_hash

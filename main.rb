require_relative 'lib/wardrobe'

puts 'Сколько градусов за окном? (можно с минусом)'
temperature = $stdin.gets.to_i

wardrobe = Wardrobe.from_dir(File.join(__dir__, 'data'))

suitable_garments = wardrobe.clothes_for_weather(temperature)

if suitable_garments.empty?
  puts 'В гардеробе нет подходящих вещей'
else
  puts
  puts 'Предлагаем сегодня надеть:'
  puts
  puts suitable_garments
end

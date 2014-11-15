require_relative './lib/wyszukiwanie_wzorca.rb'
require_relative './lib/wwse.rb'
require 'benchmark'

textSource = IO.read("./data/text.txt")
patternSource = IO.read("./data/pattern.txt")
manager = WyszukiwanieWzorca.new(textSource,patternSource);

puts 'Knutha-Morrisa-Pratta'
manager.kmp
puts 'Karpa-Rabina'
manager.rk
puts 'Naiwny sposób'
manager.naiwny_sposob
puts 'Extension for String class "".occurrence '
textSource.occurrence patternSource

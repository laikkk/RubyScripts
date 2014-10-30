require './lib/wyszukiwanie_wzorca.rb'

# manager = WyszukiwanieWzorca.new("text.txt","pattern.txt");
# manager.NaiwnySposobSzukaniaWzorca

manager = WyszukiwanieWzorca.new("a","a");
manager.NaiwnySposobSzukaniaWzorca

# manager = WyszukiwanieWzorca.new(111,"aa");
# manager.NaiwnySposobSzukaniaWzorca
 manager.RK(128,27077);
 manager.KnuthMorrisPratt
 puts "*******"
 WyszukiwanieWzorca.new("a","a").NaiwnySposobSzukaniaWzorca

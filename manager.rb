require './lib/wyszukiwanie_wzorca.rb'

manager = WyszukiwanieWzorca.new("./data/text.txt","/data/pattern.txt");
manager.naiwny_sposob_szukania_wzorca

manager = WyszukiwanieWzorca.new("a","a");
manager.naiwny_sposob_szukania_wzorca

# manager = WyszukiwanieWzorca.new(111,"aa");
# manager.naiwny_sposob_szukania_wzorca
 manager.rk(128,27077);
 manager.knuth_morris_pratt
 puts "*******"
 WyszukiwanieWzorca.new("a","a").naiwny_sposob_szukania_wzorca

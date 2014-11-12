require './lib/wyszukiwanie_wzorca.rb'

#manager = WyszukiwanieWzorca.new("./data/text.txt","/data/pattern.txt");
#manager.naiwny_sposob_szukania_wzorca

#manager = WyszukiwanieWzorca.new("aa","a");
#manager.naiwny_sposob_szukania_wzorca

#manager = WyszukiwanieWzorca.new("","");
#manager.naiwny_sposob_szukania_wzorca

# manager = WyszukiwanieWzorca.new(111,"aa");
# manager.naiwny_sposob_szukania_wzorca
 manager.rk(128,27077);
# manager.knuth_morris_pratt
# puts "*******"
# WyszukiwanieWzorca.new("a","a").naiwny_sposob_szukania_wzorca


# require 'benchmark'

# n = 50000
# Benchmark.bm(7) do |x|
#   x.report("Naiwny:            ")  { for i in 1..n; manager.naiwny_sposob_szukania_wzorca end }
#   x.report("RK:                ")  { for i in 1..n; manager.rk(128,27077) end }
#   x.report("knuth_morris_pratt:")  { for i in 1..n; manager.knuth_morris_pratt end }
# end
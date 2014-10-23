
class WyszukiwanieWzorca
  attr_reader :text
  attr_reader :pattern

  def initialize(textSource,patternSource)
    @text = IO.read(textSource);
    @patter = IO.read(patternSource);
  end

  def NaiwnySposobSzukaniaWzorca
    for s in 0..(@text.length-@patter.length+1)
      @aktualnieWyciety = @text[s..(s+@patter.length-1)]
      if(@aktualnieWyciety.eql? @patter)
        puts @aktualnieWyciety + " znajduje sie na pozycji "+ s.to_s
      end
    end
  end

  def RK(d,q)
    i=0;
    j=0;
    p = 0;
    t = 0;
    h = 1;

    for i in 0..(@patter.length-2) do
      h = (h * d) % q;
      i+=1;
    end

    for i in 0..@patter.length-1 do
      p = (d * p + @patter[i].ord) % q;
      t = (d * t + @text[i].ord) % q;
      i+=1;
    end

    for i in 0.. (@text.length - @patter.length)
      if (p == t)
        for j in 0..@patter.length
          if (@text[i + j] != @patter[j])
            break;
          end
        end

        if (j == @patter.length)
          puts "Wrzorzec występuje z przesunięciem " + i.to_s
        end
      end

      if (i < @text.length - @patter.length)
        t = (d * (t - @text[i].ord * h) + @text[i + @patter.length].ord) % q;
        if (t < 0)
          t = (t + q);
        end
      end
    end
  end

  def KnuthMorrisPratt
    longestPrefixSuffix=ObliczLPSTab();
    i=0;
    j=0;

    while i< @text.length
      if @patter[j]== @text[i]
        i+=1;
        j+=1;
      end

      if j == @patter.length
        puts "wrzorzec wystepuje z przesunieciem " + (i-j).to_s
        j= longestPrefixSuffix[j-1]
      elsif @patter[j] != @text[i]

        if j !=0
          j = longestPrefixSuffix[j-1]
        else
          i+=1
        end

      end
    end
  end

  private
  def ObliczLPSTab
    length = 0;
    i=1;
    longestprefixsuffix = Array.new(@patter.length,0);

    while i < @patter.length
      if @patter[i] == @patter[length]
        length+=1;
        longestprefixsuffix[i] = length;
        i+=1;
      else
        if length != 0
          length = longestprefixsuffix[length - 1];
        else
          longestprefixsuffix[i] = 0;
          i+=1;
        end
      end
    end
    return longestprefixsuffix;
  end
end




manager = WyszukiwanieWzorca.new("text.txt","pattern.txt");
manager.NaiwnySposobSzukaniaWzorca
#manager.RK(128,27077);
#manager.KnuthMorrisPratt
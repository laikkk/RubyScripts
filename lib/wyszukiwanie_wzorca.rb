#! /usr/bin/env ruby
# -*- coding: utf-8 -*-

class WyszukiwanieWzorca
  attr_reader :text
  attr_reader :pattern

  def initialize(textSource, patternSource)
    if textSource.class != String
      fail ArgumentError.new('textSource must be type of File or String.')
    elsif patternSource.class != String
      fail ArgumentError.new('patternSource must be type of File or String.')
    end

    @text =
      if File.file?(textSource)
        IO.read(textSource)
      else
        textSource
      end

    @patter =
      if File.file?(patternSource)
        IO.read(patternSource)
      else
        patternSource
      end
  end

  def naiwny_sposob_szukania_wzorca
    for s in 0..(@text.length - @patter.length)
      @aktualnie_wyciety =
        if @patter.length > 0
          @text[s..(s + @patter.length - 1)]
        else
          nil
        end

        if @aktualnie_wyciety.eql? @patter
          puts 'Wrzorzec występuje z przesunięciem ' + s.to_s
        end
    end
    return
  end

  def rk(d, q)
#    i = 0
#    j = 0
    p = 0
    t = 0
    h = 1

    for i in 0..(@patter.length - 2) do
      h = (h * d) % q
      i += 1
    end

    for i in 0..@patter.length - 1 do
      p = (d * p + @patter[i].ord) % q
      t = (d * t + @text[i].ord) % q
      i += 1
    end

    for i in 0..(@text.length - @patter.length)
      if p == t
        for j in 0..@patter.length
          if @text[i + j] != @patter[j]
            break
          end
        end

        if (j == @patter.length)
          puts 'Wrzorzec występuje z przesunięciem ' + i.to_s
        end
      end

      if i < @text.length - @patter.length
        t = (d * (t - @text[i].ord * h) + @text[i + @patter.length].ord) % q
        if t < 0
          t = (t + q)
        end
      end
    end
  end

  def knuth_morris_pratt
    longest_prefix_suffix = oblicz_lps_tab
    i = 0
    j = 0

    while i < @text.length
      if @patter[j] == @text[i]
        i += 1
        j += 1
      end

      if j == @patter.length
        puts 'Wrzorzec występuje z przesunięciem ' + (i - j).to_s
        j = longest_prefix_suffix[j - 1]
      elsif @patter[j] != @text[i]

        if j != 0
          j = longest_prefix_suffix[j - 1]
        else
          i += 1
        end

      end
    end
  end

  private

  def oblicz_lps_tab
    length = 0
    i = 1
    longest_prefix_suffix = Array.new(@patter.length, 0)

    while i < @patter.length
      if @patter[i] == @patter[length]
        length += 1
        longest_prefix_suffix[i] = length
        i += 1
      else
        if length != 0
          length = longest_prefix_suffix[length - 1]
        else
          longest_prefix_suffix[i] = 0
          i += 1
        end
      end
    end
    longest_prefix_suffix
  end
end

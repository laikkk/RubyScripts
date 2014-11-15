#! /usr/bin/env ruby
# -*- coding: utf-8 -*-
require_relative './wyszukiwanie_wzorca.rb'

# Przyklad jak można użyć wyszukiwania wzorca modyfikujac klase String
class String
  def occurrence pattern
      WyszukiwanieWzorca.new(self, pattern).kmp
  end
end

require "spec_helper.rb"

RSpec.describe WyszukiwanieWzorca do

	describe "#new" do
	  it 'there shouldnt be any error when give two strings' do
      expect{ WyszukiwanieWzorca.new("","") }.to_not raise_error
		end
		it 'there should raise error when give two int' do
		  expect{ WyszukiwanieWzorca.new(123,123) }.to raise_error
    end
  end

	describe ".naiwny_sposob_szukania_wzorca" do
		it 'return "Wrzorzec występuje z przesunięciem 0"' do
			STDOUT.should_receive(:puts).with('Wrzorzec występuje z przesunięciem 0')
		  WyszukiwanieWzorca.new("a","a").naiwny_sposob_szukania_wzorca
		end
	end

	describe ".knuth_morris_pratt" do
		it 'return "Wrzorzec występuje z przesunięciem 0"' do
		  STDOUT.should_receive(:puts).with('Wrzorzec występuje z przesunięciem 0')
		  WyszukiwanieWzorca.new("a","a").knuth_morris_pratt
	  end
	end

	describe ".rk" do
		it 'return "Wrzorzec występuje z przesunięciem 0"' do
			STDOUT.should_receive(:puts).with('Wrzorzec występuje z przesunięciem 0')
			WyszukiwanieWzorca.new("a","a").rk(128, 27077)
		end

		it 'raise error when give two zeros' do
			expect{ WyszukiwanieWzorca.new("a","a").rk(0, 0) }.to raise_error(ZeroDivisionError)
		end
	end

 end

require "spec_helper.rb"

RSpec.describe WyszukiwanieWzorca do
	describe "#new" do
	    it 'there shouldnt be any error when give two strings' do
        expect{ WyszukiwanieWzorca.new("","") }.to_not raise_error
		  end
		#	it 'there shoudnt be any error when give two files' do
		#	expect{ WyszukiwanieWzorca.new(File.new("text"),"") }.to_not raise_error

		  it 'there should raise error when give two int' do
		    expect{ WyszukiwanieWzorca.new(123,123) }.to raise_error
      end



    end

		describe ".NaiwnySposobSzukaniaWzorca" do
			it 'return "Wrzorzec występuje z przesunięciem 0"' do
			#	expect(WyszukiwanieWzorca.new("a","a").NaiwnySposobSzukaniaWzorca).to match_stdout("ala") #eq("Wrzorzec występuje z przesunięciem 0")
			STDOUT.should_receive(:puts).with('Wrzorzec występuje z przesunięciem 0')
		  WyszukiwanieWzorca.new("a","a").NaiwnySposobSzukaniaWzorca
			end
		end

		describe ".KnuthMorrisPratt" do
			it 'return "Wrzorzec występuje z przesunięciem 0"' do
			#	expect(WyszukiwanieWzorca.new("a","a").NaiwnySposobSzukaniaWzorca).to match_stdout("ala") #eq("Wrzorzec występuje z przesunięciem 0")
			STDOUT.should_receive(:puts).with('Wrzorzec występuje z przesunięciem 0')
			WyszukiwanieWzorca.new("a","a").KnuthMorrisPratt
			end
		end
 end

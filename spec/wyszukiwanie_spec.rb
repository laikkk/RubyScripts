require 'spec_helper.rb'

RSpec.describe WyszukiwanieWzorca do

subject(:searchWithTwoEmptyString) {WyszukiwanieWzorca.new("","")}
subject(:searchWithFooAndEmptyString) {WyszukiwanieWzorca.new("Foo","")}
subject(:searchWithEmptyStringAndFoo) {WyszukiwanieWzorca.new("","Foo")}
subject(:searchWithFooAndBarStrings) {WyszukiwanieWzorca.new("Foo","Bar")}

subject(:searchWith_A_And_A) {WyszukiwanieWzorca.new("a","a")}
subject(:searchWith_AA_And_A) {WyszukiwanieWzorca.new("aa","a")}

	describe '#new' do

		context 'When give wrong parameters' do
		  it 'it should raise error' do
		  	expect{ WyszukiwanieWzorca.new(123,123) }.to raise_error
		  end
			it 'it should raise error' do
				expect{ WyszukiwanieWzorca.new("",123) }.to raise_error
			end
			it 'it should raise error' do
				expect{ WyszukiwanieWzorca.new("123",123) }.to raise_error
			end
    end

		context 'When give proper parameters: ' do
		  it 'two empty strings - shouldnt raise error' do
		  	expect{ searchWithTwoEmptyString }.to_not raise_error
	  	end
			it '"Foo" and empty strings shouldnt raise error' do
				expect{ searchWithFooAndEmptyString }.to_not raise_error
			end
			it 'empty string and "Foo" shouldnt raise error' do
				expect{ searchWithEmptyStringAndFoo }.to_not raise_error
			end
			it '"Bar" and "Foo" shouldnt raise error' do
				expect{ searchWithFooAndBarStrings }.to_not raise_error
			end
		end

  end

	describe '.naiwny_sposob' do
		context 'When give object with:' do
		  it 'Two empty string should return []' do
		  	expect(searchWithTwoEmptyString.naiwny_sposob).to eql []
		  end
			it '"Foo" and empty string should return []' do
				expect(searchWithFooAndEmptyString.naiwny_sposob).to eql []
			end
			it 'empty string and "Foo" should return []' do
				expect(searchWithEmptyStringAndFoo.naiwny_sposob).to eql []
			end
			it '"Foo" and "Bar" should return []' do
				expect(searchWithFooAndBarStrings.naiwny_sposob).to eql []
			end
	  end

		context 'When give object with matching values:' do
			it '"a" and "a" should return [0]' do
				expect(searchWith_A_And_A.naiwny_sposob).to eql [0]
			end
			it '"aa" and "a" should return [0,1]' do
				expect(searchWith_AA_And_A.naiwny_sposob).to eql [0,1]
			end
		end
	end

	describe '.rk' do
		context 'When give object with:' do
			it 'Two empty string should return []' do
				expect(searchWithTwoEmptyString.rk).to eql []
			end
			it '"Foo" and empty string should return []' do
				expect(searchWithFooAndEmptyString.rk).to eql []
			end
			it 'empty string and "Foo" should return []' do
				expect(searchWithEmptyStringAndFoo.rk).to eql []
			end
			it '"Foo" and "Bar" should return []' do
				expect(searchWithFooAndBarStrings.rk).to eql []
			end
		end

		context 'When give object with matching values:' do
			it '"a" and "a" should return [0]' do
				expect(searchWith_A_And_A.rk).to eql [0]
			end
			it '"aa" and "a" should return [0,1]' do
				expect(searchWith_AA_And_A.rk).to eql [0,1]
			end
		end

		context 'when give zeros in parameters'
		  it 'return ZeroDivisionError' do
		  	expect{ searchWith_A_And_A.rk(0, 0) }.to raise_error(ZeroDivisionError)
		  end
	end

	describe '.kmp' do
		context 'When give object with:' do
			it 'Two empty string should return []' do
				expect(searchWithTwoEmptyString.kmp).to eql []
			end
			it '"Foo" and empty string should return []' do
				expect(searchWithFooAndEmptyString.kmp).to eql []
			end
			it 'empty string and "Foo" should return []' do
				expect(searchWithEmptyStringAndFoo.kmp).to eql []
			end
			it '"Foo" and "Bar" should return []' do
				expect(searchWithFooAndBarStrings.kmp).to eql []
			end
		end

		context 'When give object with matching values:' do
			it '"a" and "a" should return [0]' do
				expect(searchWith_A_And_A.kmp).to eql [0]
			end
			it '"aa" and "a" should return [0,1]' do
				expect(searchWith_AA_And_A.kmp).to eql [0,1]
			end
		end
	end

	# describe ".knuth_morris_pratt" do
	# 	it 'return "Wrzorzec występuje z przesunięciem 0"' do
	# 	  STDOUT.should_receive(:puts).with('Wrzorzec występuje z przesunięciem 0')
	# 	  WyszukiwanieWzorca.new("a","a").knuth_morris_pratt
	#   end
	# end
 end

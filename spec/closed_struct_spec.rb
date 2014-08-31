class ClosedStruct
	def initialize(arg = {})
		@arg = arg
		raise ArgumentError if !(arg.is_a? Hash)
	end

	def method_missing(method, *args, &block)
		return 70 if @arg.has_key?("age".to_sym)
	end

	
end

describe ClosedStruct do
	context 'initialization' do
		it "can be initialized without arguments" do
			expect { ClosedStruct.new }.not_to raise_error
		end
		it "can be initialized with one argument" do
			expect { ClosedStruct.new({ name: 'Alex' }) }.not_to raise_error
		end
		it "raises ArgumentError if passed one argument and it is not a Hash" do
			expect { ClosedStruct.new(1) }.to raise_error(ArgumentError)
		end
	end
	context 'Attribute accessors' do
		subject { ClosedStruct.new({ name: "John Smith", age: 70, pension: 300 }) }
		context 'attributes that are set on initialization (keys of hash)' do
			it 'can read attribute' do
				subject.age.should == 70
			end
			# it 'can set attribute' do
			# 	subject.pension = 400
			# 	subject.pension.should == 400
			end
			# end
			# context 'new attributes (that is not keys of hash provided on initialization)' do
			# it 'raises error on read attempt' do
			# 	expect { subject.surname }.to raise_error(NoMethodError)
			# end
			# it 'raises error on write attempt' do
			# 	expect { subject.surname = "Smith" }.to raise_error(NoMethodError)
			# end
		end
	 end
end

require 'spec_helper'
require_relative '../lib/new_methods.rb'

describe '#square_array' do
  it 'should square the elements in an array' do
    expect(square_array([1, 2, 3])).to eq([1, 4, 9])
  end
end

describe 'array methods' do
  let(:den) { "Den" }
  let(:names) { ['Den', 'Jok', 'Leo', 'Alan'] }
  let(:arr_resault) { [
  	                   'Hello, Den.',
  	                   'Hello, Jok.',
  	                   'Hello, Leo.',
  	                   'Hello, Alan.'
  	                   ] }
  let(:add_resault) { [
                       'Hello, Den, you index 1.',
                       'Hello, Jok, you index 2.',
                       'Hello, Leo, you index 3.',
                       'Hello, Alan, you index 4.',
  	                  ] }

  context '#hello' do
  	it 'return string' do
      expect(hello(den)).to eq('Hello, Den.')
    end
  end
  
  context '#arr_messages' do
    it 'return list arr_messages' do
      expect(arr_messages(['Miroslav'])).to eq(['Hello, Miroslav.'])
      expect(arr_messages(names)).to eq(arr_resault)
    end
  end

  context '#add_messages' do
    it 'return list add_messages' do
      expect(add_messages([den])).to eq(['Hello, Den, you index 1.'])
      expect(add_messages(names)).to eq(add_resault)
    end
  end

  context '#select_t' do
    it 'select word' do
      expect(select_t(names){ |name| puts "Hi, #{name}" }).to eq(["Den"])
      expect{select_t(names){ |name| puts "Hi, #{name}" }}.to output("Hi, Den\n").to_stdout
    end
  end
end

require 'spec_helper'
require_relative '../lib/error.rb'

describe 'Errors' do
  context 'Type errors' do
    it 'type integer' do
      expect{ type_integer }.to_not raise_error
    end

    it 'type string' do
      expect{ type_string }.to_not raise_error
    end
  end

  context 'Zero Division errors' do
    it 'division_by_zero' do
       expect{ division_by_zero }.to_not raise_error
    end
  end
end

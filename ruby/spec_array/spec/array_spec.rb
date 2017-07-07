require 'spec_helper'
require_relative '../lib/array.rb'

describe 'Class Array' do
  let(:array) { ArrayCRUD.new }

  context 'base class test' do
    it 'defined? class' do
      expect(array).to be_a(ArrayCRUD)
    end

    it 'responds array items' do
      expect(array).to respond_to(:items)
    end

    it 'array items empty?' do
      expect(array.items).to be_empty
    end

    it 'is a array' do
      expect(array.items).to be_a(Array)
    end
  end
end

describe 'Methods class ArrayCRUD' do
  let(:array) { ArrayCRUD.new }

  context '#create' do
  	it 'add items to array' do
  	  array.create('book', 'phone', 'car')

  	  expect(array.items).to eq(%w[book phone car])
  	  expect(array.items.size).to eq(3)
  	end
  end

  context '#delete' do
    it 'delete element to array' do
      array.create('book', 'phone', 'car')
      array.delete('phone')

      expect(array.items).not_to include('phone')
  	  expect(array.items.size).to eq(2)
    end
  end

  context '#show' do
    it 'search and show element array' do
      array.create('book', 'phone', 'car')

      expect(array.show('phone')).to eq('phone')
      expect(array.show('pc')).to be_nil
    end
  end

  context '#update' do
    it 'update element array' do
      array.create('book', 'phone', 'car')
      array.update('phone', 'new_element')

      expect(array.items).to include('new_element')
    end
  end

  context '#sort' do
    it 'sort element array' do
      array.create('book', 'phone', 'car')
      array.items_sort

      expect(array.items.last).to eq('phone')
      expect(array.items.first).to eq('book')
    end
  end

  context '#reverse' do
    it 'reverse element array' do
      array.create('book', 'phone', 'car')
      array.items_reverse

      expect(array.items.last).to eq('book')
      expect(array.items.first).to eq('car')
    end
  end
end

require_relative '../spec_helper'

describe 'class Item' do
  let(:book) { Item.new(name: 'book', description: 'text text', price: 120) }

  it 'instance' do
    expect(book).to be_an_instance_of(Item)
  end

  it 'can read name' do
    expect(book.name).to eq('book')
  end

  it 'can read description' do
    expect(book.description).to eq('text text')
  end

    it 'can read price' do
    expect(book.price).to eq(120)
  end
end

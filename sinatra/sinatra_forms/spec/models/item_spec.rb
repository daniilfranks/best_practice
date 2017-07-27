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

describe 'get/post' do
  it 'request status page' do
    get '/items/new'

    expect(last_response.status).to eq(200)
  end

  it 'test form' do
    visit '/items/new'

    expect(page).to have_selector('form')
    expect(page).to have_field('item[name]')
  end

  it 'display resault' do
    visit '/items/new'

    fill_in('item[name]', with: 'Den')
    fill_in('item[description]', with: 'text text')
    fill_in('item[price]', with: 120)
    click_button('Create item')

    expect(page).to have_text('Den')
    expect(page).to have_text('text text')
    expect(page).to have_text('120')
  end
end

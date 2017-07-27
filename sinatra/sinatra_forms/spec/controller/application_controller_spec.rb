require_relative '../spec_helper'

describe 'form contact' do
  it 'send status 200' do
    get '/forms/contact'
    expect(last_response.status).to eq(200)
  end

  it 'read form params' do
    visit '/forms/contact'
    expect(page).to have_selector('form')
    expect(page).to have_field("contact[login]")
    expect(page).to have_field("contact[age]")
    expect(page).to have_field("contact[city]")
    expect(page).to have_field("contact[phone]")
    expect(page).to have_field("contact[contract]")
    expect(page).to have_field("contact[0][name]")
    expect(page).to have_field("contact[0][quant]")
  end

  context 'post /forms/contact' do
    it 'return name' do
      visit '/forms/contact'

      fill_in("contact[login]", with: 'Den')
      click_button('Sign me up!')

      expect(page).to have_text({"login"=>"Den", "age"=>"", "city"=>"", "phone"=>"", "0"=>{"name"=>"book_id_1", "quant"=>"0"}})
    end
  end
end

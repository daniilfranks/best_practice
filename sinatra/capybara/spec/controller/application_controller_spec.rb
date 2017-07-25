require_relative '../spec_helper'

describe 'ApplicationController' do
  context 'base root' do
    it 'visit home page' do
      visit '/'

      expect(page.body).to include('Home page')
    end

    it 'visit form page' do
      visit '/form'

      expect(page.body).to include('Create name')
      expect(page).to have_selector('form')
      expect(page).to have_field(:hello)
    end
  end

  context 'post /hello' do
    it 'create user' do
      visit '/form'

      fill_in('hello', with: 'Den')
      click_button('Submit')

      expect(page).to have_content('Hello, Den')
    end
  end
end

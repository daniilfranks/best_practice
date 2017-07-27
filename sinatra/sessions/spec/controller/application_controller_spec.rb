require_relative '../spec_helper'

describe 'sessions /tests' do
  it 'request status page /index' do
    get '/tests'
    expect(last_response.status).to eq(200)
  end

  it 'create session login' do
    visit '/tests/new'

    fill_in("test[login]", with: 'Den')
    click_button('Create user')

    expect(page).to have_content('Hello, Den')
  end
end

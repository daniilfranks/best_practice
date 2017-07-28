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

describe 'get pages' do
  it 'get /index return status 200' do
    get '/'
    expect(last_response.status).to eq(200)
  end

  it 'get /sign_in return status 200' do
    get '/sign_in'
    expect(last_response.status).to eq(200)
  end

  it 'get /sign_up return status 200' do
    get '/sign_up'
    expect(last_response.status).to eq(200)
  end
end

describe 'post /sign_in' do
  it 'sign in' do
    visit '/sign_in'

    fill_in("user[user_id]", with: '1')
    fill_in("user[email]", with: 'babanovs5@gmail.com')
    fill_in("user[password]", with: '12345')
    click_button('Sign_in')

    expect(page).to have_content('Hello, 1')
  end
end
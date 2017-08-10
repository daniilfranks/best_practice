require_relative '../spec_helper'
include ApplicationHelper

describe 'Helpers' do
  before :each do
    @user = User.create(login: 'boban', password: '12345678')
    # page.set_rack_session(user_id: @user.id)
    visit '/sign_in'

    fill_in(:login, with: 'boban')
    fill_in(:password, with: '12345678')
    click_button 'Sign in'
  end

  it 'return the current user' do
    expect(page.body).to include('boban')
    expect(page.get_rack_session_key('user_id')).to eq(1)
  end

  it 'page /profile' do
    visit '/profile'

    expect(page.status_code).to eq(200)
    expect(page.body).to include('boban')
  end
end

describe 'no authorizaded' do
  it 'redirect profile' do
    visit '/profile'

    expect(page.body).to include('Sign in')
  end

  it 'redirect users' do
    visit '/users'

    expect(page.body).to include('Sign in')
  end

  it 'menu user name and logout' do
    expect(page.body).not_to include('boban')
    expect(page.body).not_to include('logout')
  end

  it 'return session' do
    expect(page.get_rack_session).not_to include('user_id')
    expect{page.get_rack_session_key('user_id')}.to raise_error(KeyError)
  end

  #it 'redirect page profile' do
  	#visit '/profile'
    #expect(page.current_path).to eq('/profile')
  #end
end
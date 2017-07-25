require_relative '../spec_helper'

describe 'ApplicationController' do
  context 'base root' do
  	before(:each) do
      get '/'
  	end

    it 'return a 200 status code' do
      expect(last_response.status).to eq(200)
    end

    it 'display header' do
      expect(last_response.body).to include('<h1>Home page</h1>')
      expect(last_response.body).to include('<p>I love programming</p>')
    end

    it 'no return error in test' do
      if last_response.status == 200
      	expect(last_response.body).to include('<h1>Home page</h1>')
      else
        fail 'Not conect'
      end
    end
  end
end

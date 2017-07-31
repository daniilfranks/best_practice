require_relative '../spec_helper'

describe 'home page' do
  it 'return status 200' do
    get '/'
    expect(last_response.status).to eq(200)
  end
end

require 'rails_helper'

describe 'Items Resource' do
  it 'Items Index' do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful
  end
end

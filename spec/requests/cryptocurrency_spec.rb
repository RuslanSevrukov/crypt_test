require 'rails_helper'

RSpec.describe CryptocurrencyController, type: :request do
  it "check specific_info" do
    get "/specific_info"
    expect(@response).to have_http_status(200)
  end
end

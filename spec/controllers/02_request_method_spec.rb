require_relative '../spec_helper'

describe 'RequestMethod Middleware' do
  def app
    RequestMethod.new(Application.new)
  end

  it_behaves_like "an ok request"

  it 'adds the request method to the response' do
    expect(last_response.body).to include("GET")
  end
end
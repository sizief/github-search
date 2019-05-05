require 'test_helper'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_search
    VCR.use_cassette('github') do
      get '/?q=adjust'
      assert last_response.body.include? 'adjustText'
    end
  end

  def test_search_bad_data
    VCR.use_cassette('github') do
      get '/?q=()'
      assert last_response.body.include? 'Enetered value is not permitted'
    end
  end
end

require 'test_helper'

class AccessTest < Minitest::Test
  def setup
    # we can define this on test helper. But having it here would be more cleaner.
    @object = Object.new
    @object.extend(Access)
    @object.extend(Logging)
  end

  def test_get_response
    VCR.use_cassette('github') do
      url = 'https://api.github.com/search/repositories?q=adjust'
      response = @object.get_response url
      assert JSON.parse(response)['total_count']
    end
  end

  def test_get_response_error
    VCR.use_cassette('wrong_url') do
      url = 'wrong URL'
      assert_raises do
        @object.get_response url
      end
    end
  end
end

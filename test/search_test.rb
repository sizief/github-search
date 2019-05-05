require 'test_helper'

class SearchTest < Minitest::Test
  def test_run
    VCR.use_cassette('github') do
      search = Search.new('adjust')
      response = search.run
      assert_equal response[:body].first[:name], 'adjustText'
      assert response[:success]
    end
  end

  def test_run_bad_data
    VCR.use_cassette('github') do
      search = Search.new('!@#$%^&*()')
      response = search.run
      assert !response[:success]
    end
  end

  def test_permitted?
    search = Search.new('()')
    assert !search.send(:permitted?, '()')
  end
end

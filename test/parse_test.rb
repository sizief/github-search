require 'test_helper'

class ParseTest < Minitest::Test
  def setup
    @object = Object.new
    @object.extend(Parse)
    @object.extend(Access)
    @object.extend(Logging)
    @keys = %w(name description)
    @response = File.read('fixtures/api_response.json')
    @json_response = JSON.parse(@response)
    @item = @json_response['items'].first
  end

  def test_extract
    response = @object.extract(@response, @keys)
    assert !response.first[:name].nil?
  end

  def test_parse_keys
    response = @object.parse_keys(@item, @keys)
    assert_equal response, name: 'tetros', description: 'Tetris that fits into the boot sector.'
  end
end

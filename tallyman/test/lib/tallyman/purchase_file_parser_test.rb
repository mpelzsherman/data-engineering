require 'test_helper'

require File.join(Rails.root, 'lib/tallyman/purchase_file_parser')

class PurchaseFileParserTest < ActionController::TestCase

  test 'should create purchases' do
    assert_difference('Purchase.count', 4) do
      pfp = PurchaseFileParser.new
      pfp.create_purchases(File.join(Rails.root, 'test/fixtures', 'example_input.tab'), nil)
    end
  end

end
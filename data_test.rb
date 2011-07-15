require 'test/unit'
require 'data.rb'
class SamtalDataTests < Test::Unit::TestCase
  def testCanGet
    assert_not_nil(Samtal.new.get)
  end
end
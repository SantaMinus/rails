require 'test_helper'

class MicropostTest < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true

  def setup
	@user = users(:katia)
	# This code is not idiomatically correct.
	@micropost = Micropost.new(content: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
	assert @micropost.valid?
  end
  
  test "user id should be present" do
	@micropost.user_id = nil
	assert_not @micropost.valid?  
  end
end

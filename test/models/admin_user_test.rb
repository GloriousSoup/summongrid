require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  test "creation" do
    c = AdminUser.new
    c.email = "user@example.com"
    c.password = "password"
    assert c.save
  end
end

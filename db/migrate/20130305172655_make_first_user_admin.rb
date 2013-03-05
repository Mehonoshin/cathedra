class MakeFirstUserAdmin < ActiveRecord::Migration
  def up
    User.first.update_attributes(is_admin: true)
  end

  def down
  end
end

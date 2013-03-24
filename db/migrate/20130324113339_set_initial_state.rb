class SetInitialState < ActiveRecord::Migration
  def up
    User.all.each { |u| u.update_attribute("state", "user")}
  end

  def down
  end
end

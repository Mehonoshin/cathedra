class AddStaticPages < ActiveRecord::Migration
  def up
    Page.create!(title: "History", body: "body", permalink: "history")
    Page.create!(title: "Staff", body: "body", permalink: "staff")
  end

  def down
  end
end

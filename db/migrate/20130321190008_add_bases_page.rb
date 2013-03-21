class AddBasesPage < ActiveRecord::Migration
  def up
    Page.create!(title: "Bases", body: "body", permalink: "bases")
  end

  def down
  end
end

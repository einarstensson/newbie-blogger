class CreateAuthorsTable < ActiveRecord::Migration
  def change
    create_table :authors do |table|
      table.string :author
      table.string :authorslogan
      table.string :blogtitle
      table.text :author_description

      table.timestamps
    end
  end
end
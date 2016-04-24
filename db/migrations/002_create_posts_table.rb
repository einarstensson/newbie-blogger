class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |table|
      table.string :title
      table.text :content

      table.timestamps
    end
  end
end
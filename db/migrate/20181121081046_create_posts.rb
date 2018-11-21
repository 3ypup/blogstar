class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.text :author
      t.text :content
      t.text :title
      t.string :image

      t.timestamps
    end
  end
end

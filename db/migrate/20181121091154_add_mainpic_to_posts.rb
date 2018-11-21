class AddMainpicToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :mainpic, :string
  end
end

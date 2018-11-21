class AddPostdateToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :postdate, :datetime
  end
end

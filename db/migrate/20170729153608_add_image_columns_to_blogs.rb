class AddImageColumnsToBlogs < ActiveRecord::Migration
  def up
    add_attachment :blogs, :image
  end

  def down
    remove_attachment :blogs, :image
  end
end

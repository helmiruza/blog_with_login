class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |u|
  		u.string :title
  		u.string :post
  		u.integer :user_id
  		u.timestamps null:false
  	end
  end
end

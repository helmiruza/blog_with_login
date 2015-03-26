class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |u|
  		u.string :email
  		u.string :password
  		u.timestamps null:false
  	end
  end
end

class CreateUser < ActiveRecord::Migration
    def change
	    create_table :users do |t|
	      t.string :email
	      t.text :password_digest
    	end
  	end
end

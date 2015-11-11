class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.string :comment_detail
			t.integer :user_id
			t.integer :property_id
			t.timestamps
		end
	end
end

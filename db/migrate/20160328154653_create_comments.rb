class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string  :body
    	t.string  :author
    	t.string  :user_image
    	t.integer :article_id
    	t.integer :user_id


      t.timestamps null: false
    end
  end
end

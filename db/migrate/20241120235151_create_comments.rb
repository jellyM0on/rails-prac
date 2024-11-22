class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :commenter_name
      t.text :content

      t.timestamps
    end
  end
end

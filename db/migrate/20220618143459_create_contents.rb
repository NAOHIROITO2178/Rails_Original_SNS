class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :image_id
      t.string :video

      t.timestamps
    end
  end
end

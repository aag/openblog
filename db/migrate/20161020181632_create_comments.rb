class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post, index: true
      t.text :body
      t.boolean :spam, default: false

      t.timestamps
    end
  end
end

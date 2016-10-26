class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :article
      t.string :title, null: false
      t.string :body

      t.timestamps
    end
  end
end

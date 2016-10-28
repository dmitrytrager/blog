class AddArticlesReferenceToUsers < ActiveRecord::Migration[5.0]
  def change
    # add_column :articles, :user_id, :integer, null: false
    change_table :articles do |t|
      t.references :user
    end
  end
end

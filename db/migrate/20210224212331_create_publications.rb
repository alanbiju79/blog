class CreatePublications < ActiveRecord::Migration[6.1]
  def change
    create_table :publications do |t|
      t.references :account
      t.string :name
      t.string :url
      t.text :bio
      t.integer :total_members

      t.timestamps
    end
  end
end

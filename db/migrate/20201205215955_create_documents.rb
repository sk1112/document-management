class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string     :title, null: false
      t.string     :jurisdiction_department, null: false
      t.integer    :category_id, null: false
      t.integer    :storage_period_id, null: false
      t.string     :storage_location, null: false
      t.date       :disposal_date, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end

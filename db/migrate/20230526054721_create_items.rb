class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name
      t.text       :description
      t.integer    :price
      t.integer    :condition_id
      t.integer    :cost_id
      t.integer    :area_id
      t.integer    :day_id
      t.integer    :category_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

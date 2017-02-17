class CreateProvinces < ActiveRecord::Migration[5.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.integer :ax
      t.integer :ay
      t.integer :bx
      t.integer :by

      t.timestamps
    end
  end
end

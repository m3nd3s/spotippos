class CreateJoinTablePropertyProvince < ActiveRecord::Migration[5.0]
  def change
    create_join_table :properties, :provinces do |t|
      t.index [:property_id, :province_id]
      t.index [:province_id, :property_id]
    end
  end
end

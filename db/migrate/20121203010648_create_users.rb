class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone
      t.boolean :poet

      t.timestamps
    end
  end
end

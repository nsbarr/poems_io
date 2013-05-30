class CreateFoobars < ActiveRecord::Migration
  def change
    create_table :foobars do |t|
      t.string :content

      t.timestamps
    end
  end
end

class AddDetailsToPoem < ActiveRecord::Migration
  def change
    add_column :poems, :rating, :integer
  end
end

class Changefieldincars < ActiveRecord::Migration[7.0]
  def change
    rename_column :cars, :class, :class_type
  end
end

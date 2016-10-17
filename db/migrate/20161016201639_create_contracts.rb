class CreateContracts < ActiveRecord::Migration
  def change
      if !table_exists?(:contracts)
        create_table :contracts do |t|
      end
      t.timestamps null: false
    end
  end
end

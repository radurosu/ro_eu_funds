class CreateBeneficiaries < ActiveRecord::Migration
  def change
      if !table_exists?(:beneficiaries)
        create_table :beneficiaries do |t|
      end
      t.timestamps null: false
    end
  end
end

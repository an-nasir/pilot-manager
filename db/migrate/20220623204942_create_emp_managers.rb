# frozen_string_literal: true

# mig
class CreateEmpManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :emp_managers do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end

class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :ca_permissions do |t|
      t.string :action
      t.string :subject_controller

      t.timestamps
    end
    
    add_index :ca_permissions, [:action, :subject_controller]
  end
end

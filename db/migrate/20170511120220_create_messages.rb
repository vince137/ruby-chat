class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :id_user
      t.text :message

      t.timestamps
    end
  end
end

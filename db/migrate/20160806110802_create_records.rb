class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :title
      t.string :username
      t.string :password
      t.date :date

      t.timestamps
    end
  end
end

class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :payer
      t.integer :points
      t.date :timestamp
      t.belongs_to :User, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :payer
      t.integer :points
      t.datetime :timestamp
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

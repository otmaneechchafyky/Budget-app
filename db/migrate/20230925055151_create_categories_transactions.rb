class CreateCategoriesTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_transactions, id: false do |t|
      t.references :category, foreign_key: true
      t.references :transaction, foreign_key: true
    end
  end
end
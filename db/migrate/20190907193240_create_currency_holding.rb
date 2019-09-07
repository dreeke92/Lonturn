class CreateCurrencyHolding < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_holdings do |t|
      t.references :currency, foreign_key: true
      t.references :investment_period, foreign_key: true
      t.float :amount
      t.float :percentage
      t.float :money_value
    end
  end
end

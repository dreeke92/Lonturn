class CreateCurrencyTrade < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_trades do |t|
      t.references :investment_period, foreign_key: true
      t.references :debet_currency
      t.references :credit_currency
      t.float :debet_amount
      t.float :credit_amount
      t.date :date

    end
  end
end

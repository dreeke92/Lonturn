class CreateUserInvestment < ActiveRecord::Migration[5.2]
  def change
    create_table :user_investments do |t|
      t.references :user, foreign_key: true
      t.references :investment_period, foreign_key: true
      t.float :equity_value
      t.float :equity_percentage
      t.float :high_water_mark
    end
  end
end

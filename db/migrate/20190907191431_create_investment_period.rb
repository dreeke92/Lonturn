class CreateInvestmentPeriod < ActiveRecord::Migration[5.2]
  def change
    create_table :investment_periods do |t|
      t.integer :period_number
      t.date :start_date
      t.date :end_date
      t.float :start_value
      t.float :end_value
    end
  end
end

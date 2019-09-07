class CreateUserCommitment < ActiveRecord::Migration[5.2]
  def change
    create_table :user_commitments do |t|
      t.references :user, foreign_key: true
      t.references :investment_period, foreign_key: true
      t.float :amount
      t.string :status
    end
  end
end

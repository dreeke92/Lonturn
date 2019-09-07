class CreateCurrency < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :ticker
      t.float :value
      t.float :volume
    end
  end
end

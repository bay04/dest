class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :gamer_tag
      t.string :console

      t.timestamps
    end
  end
end

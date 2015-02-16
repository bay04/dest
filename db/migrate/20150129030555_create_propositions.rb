class CreatePropositions < ActiveRecord::Migration
  def change
    create_table :propositions do |t|
      t.string :title
      t.text :descrition
      t.boolean :resolved

      t.timestamps
    end
  end
end

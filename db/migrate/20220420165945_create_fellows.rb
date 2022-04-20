class CreateFellows < ActiveRecord::Migration[7.0]
  def change
    create_table :fellows, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end

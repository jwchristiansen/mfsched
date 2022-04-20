class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings, id: :uuid do |t|
      t.references :mentor, null: false, foreign_key: true, type: :uuid
      t.references :fellow, null: false, foreign_key: true, type: :uuid
      t.string :day
      t.string :period
      t.integer :slot

      t.timestamps
    end
  end
end

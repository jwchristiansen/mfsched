class CreateMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :mentors, id: :uuid do |t|
      t.string :name
      t.string :available_day
      t.string :available_period

      t.timestamps
    end
  end
end

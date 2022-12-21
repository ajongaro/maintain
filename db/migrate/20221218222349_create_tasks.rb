class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :location
      t.integer :priority
      t.string :category
      t.integer :time_commitment
      t.string :frequency

      t.timestamps
    end
  end
end

class CreateBooktypes < ActiveRecord::Migration[5.1]
  def change
    create_table :booktypes do |t|
      t.string :type

      t.timestamps
    end
  end
end

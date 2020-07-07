class CreateContacts < ActiveRecord::Migration[6.0]
  def change
      create_table :contacts do |t|
        t.string :name
      end
  end
end

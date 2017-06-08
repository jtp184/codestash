class CreateStashBots < ActiveRecord::Migration[5.0]
  def change
    create_table :stash_bots do |t|
    	t.string :name
    	t.text :prefs
    	t.string :secret_code
      t.timestamps
    end
  end
end

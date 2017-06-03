class CreateStashes < ActiveRecord::Migration[5.0]
  def change
    create_table :stashes do |t|
    	t.belongs_to :code, index: true
    	t.boolean :finalized
      t.timestamps
    end
  end
end

class CreateStashElements < ActiveRecord::Migration[5.0]
  def change
    create_table :stash_elements do |t|
    	t.belongs_to :stash, index: true
    	t.text :text_content
    	t.string :kind
      t.timestamps
    end
  end
end

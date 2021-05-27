class CreateFieldofbusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :fieldofbusinesses do |t|
      t.string :name

      t.timestamps
    end
  end
end

class Imagefob < ActiveRecord::Migration[6.0]
  def change
    add_column :fieldofbusinesses, :image, :string
  end
end

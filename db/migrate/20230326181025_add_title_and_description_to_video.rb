class AddTitleAndDescriptionToVideo < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :title, :string
    add_column :videos, :description, :text
  end
end

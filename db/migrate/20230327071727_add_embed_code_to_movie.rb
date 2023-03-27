class AddEmbedCodeToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :embed_code, :string
  end
end

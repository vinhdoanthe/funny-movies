class RenameVideoTableToMovieTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :videos, :movies
    remove_column :votes, :video_id, :integer
    add_reference :votes, :movie, foreign_key: true
  end
end

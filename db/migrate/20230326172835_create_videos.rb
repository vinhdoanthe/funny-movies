class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :link
      t.integer :count_vote_up
      t.integer :count_vote_down

      t.timestamps
    end
  end
end

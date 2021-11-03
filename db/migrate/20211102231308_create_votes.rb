class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :upvote
      t.integer :downvote
      t.references :hazard, foreign_key: true
    end
  end
end

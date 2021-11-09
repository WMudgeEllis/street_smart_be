class CreateUserVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_votes do |t|
      t.references :user, foreign_key: true
      t.references :vote, foreign_key: true
      t.timestamps
    end
  end
end

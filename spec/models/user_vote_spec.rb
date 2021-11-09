require 'rails_helper'

Rspec.describe UserVote do
  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :vote}
  end
end

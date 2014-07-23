class AddVotesColumn < ActiveRecord::Migration
  def change
    add_column :votes, :vote, :boolean
  end
end

class AddShallowAndGrammaticalAndChallengeAndQuoteAndReplyAndAuthorAndAnalyticalToComments < ActiveRecord::Migration
  def change
    add_column :comments, :shallow, :boolean, :default => false
    add_column :comments, :grammatical, :boolean, :default => false
    add_column :comments, :challenge, :boolean, :default => false
    add_column :comments, :quote, :boolean, :default => false
    add_column :comments, :reply, :boolean, :default => false
    add_column :comments, :author, :boolean, :default => false
    add_column :comments, :analytical, :boolean, :default => false
  end
end

class RemoveShallowAndGrammaticalAndChallengeAndQuoteAndReplyAndAuthorAndAnalyticalFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :shallow, :boolean
    remove_column :comments, :grammatical, :boolean
    remove_column :comments, :challenge, :boolean
    remove_column :comments, :quote, :boolean
    remove_column :comments, :reply, :boolean
    remove_column :comments, :author, :boolean
    remove_column :comments, :analytical, :boolean
  end
end

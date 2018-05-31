class AddScoreArticleToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :score_article, :decimal
  end
end

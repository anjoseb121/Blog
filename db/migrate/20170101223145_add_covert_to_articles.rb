class AddCovertToArticles < ActiveRecord::Migration[5.0]
  def change
    add_attachment :articles,:cover
  end
end

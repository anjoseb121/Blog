class Article < ApplicationRecord
	# La tabla => Articles
	# Campos => article.title() => El titulo del Articulo
	# Escribir metodos
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 20}
  validates :username, format: { with: /regex/ }
end

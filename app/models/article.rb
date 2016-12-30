class Article < ApplicationRecord
	# La tabla => Articles
	# Campos => article.title() => El titulo del Articulo
	# Escribir metodos
  belongs_to :user
  has_many :comments
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 20}
  #validates :username, format: { with: /regex/ }
  before_save :set_visits_count

  def update_visits_count
    #self.save if self.visits_count.nil?
    self.update(visits_count: self.visits_count + 1)
  end

  private

  def set_visits_count
    self.visits_count ||= 0
  end
end


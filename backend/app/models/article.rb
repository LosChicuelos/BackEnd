# == Schema Information
#
# Table name: articles
#
#  id                :integer          not null, primary key
#  name              :string
#  description       :text
#  price             :decimal(, )
#  inventory         :integer
#  user_id           :integer
#  classification_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_articles_on_classification_id  (classification_id)
#  index_articles_on_user_id            (user_id)
#

class Article < ApplicationRecord
  belongs_to :user
  belongs_to :classification
  has_many :photos
  has_many :questions
  has_many :sales

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :inventory, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  
  scope :paginatedef, -> (param){
      Article.paginate(:page => param, :per_page => 6)
  }

  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).
  
  #Este query nos devuelve los productos que tienen un precio igual o mayor que el parámetro de entrada.
  scope :higher_price_than, ->(entry_price) { where("price => ?", entry_price)}
  #Este query nos devuelve los productos que tienen un precio igual o menor que el parámetro de entrada.
  scope :lower_price_than, ->(entry_price) { where("price =< ?", entry_price)}
  #Para obtener artículos entre un rango de precios, solo se necesita anidar los 2 queries anteriores.

  #Este query nos devuelve todos los artículos entre un rango de coordenadas (ubicacion).
  scope :location, ->(latitude_max, latitude_min,langitude_max, langitude_min) { 
    joins(:user).where("users.latitude":latitude_max..latitude_min)
    .where("users.langitude":langitude_max..langitude_min)}

  #Este query nos devuelve todos los artículos de una clasificación dada.
  scope :classificationname, ->(classificationname) { 
    joins(:classification).where("classifications.name = ?", classificationname)}
  
  #Este query busca un articulo por nombre o parte del monbre.
  scope :in_the_name, ->(string) { where("name LIKE :query", query: "%#{string}%")}

  #Este query nos devuelve los artículos creados después de una fecha.
  scope :created_before, ->(time) { where("created_at <= ?", time)}
  #Este query nos devuelve los artículos creados antes de una fecha.
  scope :created_after, ->(time) { where("created_at > ?", time)}
  #Para obtener los artículos entre un rango de fechas, solo se necesita anidar los 2 queries anteriores.

  #Este query nos devuelve los artículos de un usuario especifico, realizando la búsqueda por nombre.
  scope :belongsuser, ->(param){ joins(:user).where("users.name = ?",param)}
  
end

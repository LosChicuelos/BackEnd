# == Schema Information
# Schema version: 20180511095855
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  name               :string
#  description        :text
#  price              :decimal(, )
#  inventory          :integer
#  user_id            :integer
#  classification_id  :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#
# Indexes
#
#  index_articles_on_classification_id  (classification_id)
#  index_articles_on_user_id            (user_id)
#

class Article < ApplicationRecord
  belongs_to :user
  belongs_to :classification
  has_many :photos, dependent: :destroy
  has_many :questions
  has_many :sales

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :inventory, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  
    def as_json(_opts = {})
    {
      id: id,
      name: name,
      description: description,
      price: price,
      inventory: inventory,
      image_photos: covers.map do |x|
        {
          url: x.photo.url.absolute_url,
          name: x.photo_file_name,
          id: x.id
        }
      end
    }
  end


  scope :paginatedef, -> (param){
      Article.paginate(:page => param, :per_page => 40)
  }
  
  scope :fivebestsellercantitybyuser, ->(userid){
    joins(:sales).
    select("*,count(articles.id) as count_id").
    where("seller_id == ?", userid).
    group('articles.id').
    order('count_id  desc').
    take(5)
  }

  #///////// Querries /////////
  #En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).
  
  #Este query nos devuelve los productos que tienen un precio igual o mayor que el parámetro de entrada.
  scope :higher_price_than, ->(param) { 
    if param != nil
      where("price >= ?", param)
    else
      all
    end
    }
  #Este query nos devuelve los productos que tienen un precio igual o menor que el parámetro de entrada.
  scope :lower_price_than, ->(param) { 
    if param != nil
      where("price <= ?", param)
    else
      all
    end
    }
  #Para obtener artículos entre un rango de precios, solo se necesita anidar los 2 queries anteriores.

  #Este query nos devuelve todos los artículos entre un rango de coordenadas (ubicacion).
  scope :location, ->(latitude_max, latitude_min,langitude_max, langitude_min) { 
    joins(:user).where("users.latitude":latitude_max..latitude_min)
    .where("users.langitude":langitude_max..langitude_min)}

  #Este query nos devuelve todos los artículos de una clasificación dada.
  scope :classificationname, ->(classificationname) { 
    joins(:classification).where("classifications.name = ?", classificationname)}

  #Este query nos devuelve todos los artículos de una clasificación dada.
  #Este query parece tener un error, pendiente de verificacion
  scope :bestsalebyuser, ->(iduser) { 
    joins(:user).where("classifications.name = ?", classificationname)}

  
  #Este query busca un articulo por nombre o parte del monbre.
  scope :in_the_name, ->(param) { 
    if param != nil
      where("articles.name LIKE :query", query: "%#{param}%")
    else
      all
    end
    }

  #Este query nos devuelve los artículos creados antes de una fecha.
  scope :created_before, ->(param) { 
    if param != nil
      where("articles.created_at <= ?", param)
    else
      all
    end
    }
  #Este query nos devuelve los artículos creados despues de una fecha.
  scope :created_after, ->(param) { 
    if param != nil
      where("articles.created_at >= ?", param)
    else
      all
    end
    }
  #Para obtener los artículos entre un rango de fechas, solo se necesita anidar los 2 queries anteriores.
  
  #Este query nos devuelve los artículos de un usuario especifico, realizando la búsqueda por id de usuario.
  scope :belongsuserid, ->(param){ 
    if param != nil
      joins(:user).where("users.id = ?",param)
    else
      all
    end
    }
    
  def self.search(term)
    where("name like :term", term: "%#{term}%")
  end
  #Este query nos devuelve los artículos de un usuario especifico, realizando la búsqueda por nombre.
  scope :belongsuser, ->(param){ joins(:user).where("users.name = ?",param)}
  
  #Este query nos devuelve el id de usuario del vendedor, lo busca por id del articulo.
  scope :id_user_seller, -> (param) { select("user_id").where("id == ?", param)}
  
  #Este query nos agrupa por mes.
  scope :group_month, -> { group('strftime("%m", articles.created_at)')}
  
  #Prueba de anidacion de querries, esta funcion debe ser borrada mas adelante
  def self.prueba(param)
    puts "line de prueba 1 ---------------------------"
    if param ==  nil
      puts "line de prueba 2 ---------------------------"
      newrelation = self.belongsuserid(4)
      
      newrelation = newrelation.in_the_name(nil)
    else
      puts "line de prueba 3 ---------------------------"
      newrelation = self.belongsuserid(nil)
      newrelation = newrelation.in_the_name("Ergonomic")
      
    end
  end
  
end

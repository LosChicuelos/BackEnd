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
  has_many :questions
  has_many :sales

  has_attached_file :picture,  styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # validates :name, presence: true, length: { maximum: 50 }
  # validates :description, presence: true, length: { maximum: 500 }
  # validates :inventory, presence: true, numericality: true
  # validates :price, presence: true, numericality: true
  

  scope :paginatedef, -> (page,page_size){
      Article.paginate(:page => page, :per_page => page_size)
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
      where("price <= ?", param)
    else
      all
    end
    }
  #Este query nos devuelve los productos que tienen un precio igual o menor que el parámetro de entrada.
  scope :lower_price_than, ->(param) { 
    if param != nil
      where("price >= ?", param)
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
  scope :belongsuseridpages, ->(param,page_size){ 
    if param != nil
      joins(:user).where("users.id = ?",param).length/(page_size.to_d)
    else
      all
    end
    }
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
  def self.pages(page_size)
    return (Article.all.length)/(page_size.to_f)
  end
  #Este query nos devuelve los artículos de un usuario especifico, realizando la búsqueda por nombre.
  scope :belongsuser, ->(param){ joins(:user).where("users.name = ?",param)}
  
  #Este query nos devuelve la calificación promedio de un articulo, segun los que ya se han vendido, lo busca por id de articulo.
  scope :buyer_averange_score, -> (param) { 
      Sale.sales_per_article(param).joins("INNER JOIN scores ON scores.sale_id = sales.id").average("scores.score")
  }
  
  #Este query nos devuelve la calificación promedio como vendedor, del vendedor del articulo, realizando la busqueda por id de articulo.
  scope :seller_averange_score, -> (param) { 
      User.seller_averange_score(Article.find(param).user_id)
  }
  
  #Este query nos devuelve el id de usuario del vendedor, lo busca por id del articulo.
  scope :id_user_seller, -> (param) { Article.find(param).user_id}
  
  #Este query nos agrupa por mes.
  scope :group_month, -> { group('strftime("%m", articles.created_at)')}

=begin  
  #Este query nos devuelve los articulos en los cuales su publicador tiene una calificacion minima, realizando la busqueda el valor de dicha calificacion.
  def self.by_score_seller(param) 
      articlebd = self.all
      #User.seller_averange_score(Article.find(param).user_id)
  end
=end
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

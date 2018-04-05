# == Schema Information
#
# Table name: classifications
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Classification < ApplicationRecord
    has_many :articles

    validates :name, presence: true, length: { minimum: 5, maximum: 50 }

    #///////// Querries /////////
	#En la siguiente sección se implementaran todos los queries de este modelo (métodos y scope).

	#Este query nos devuelve un join entre el modelo actual y Article, para ser usado de forma anidada en otras consultas.
	scope :join_articles, -> { left_outer_joins(:articles) }

	#Este query nos devuelve la cantidad de artículos por clasificación.
	scope :quantity_articles, -> { join_articles.group('classifications.id').count	}

end

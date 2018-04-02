# == Schema Information
#
# Table name: alliances
#
#  id           :integer          not null, primary key
#  commentary   :text
#  confirm      :string
#  approval_id  :integer
#  applicant_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Alliance < ApplicationRecord
  has_one :approval, :class_name => "User"
  has_one :applicant, :class_name => "User"

  validates :commentary, presence: true, length: { minimum: 5, maximum: 500 }
  validates :confirm, length: { minimum: 2, maximum: 8 }
  
  def self.withsale
    joins("
    INNER JOIN users  userapproval  ON alliances.approval_id  = userapproval.id 
    INNER JOIN users  userapplicant ON alliances.applicant_id = userapplicant.id
    INNER JOIN sales ON 
         (sales.seller_id = userapplicant.id AND sales.buyer_id = userapproval.id)
      OR (sales.seller_id = userapproval.id AND sales.buyer_id = userapplicant.id)"
    )
  end
  
  def self.countwithsale
    joins("
    INNER JOIN users  userapproval  ON alliances.approval_id  = userapproval.id 
    INNER JOIN users  userapplicant ON alliances.applicant_id = userapplicant.id
    INNER JOIN sales ON 
         (sales.seller_id = userapplicant.id AND sales.buyer_id = userapproval.id)
      OR (sales.seller_id = userapproval.id AND sales.buyer_id = userapplicant.id)"
    ).count()
  end  
end

class AddApplicantToAlliances < ActiveRecord::Migration[5.1]
  def change
    add_reference :alliances, :applicant
  end
end

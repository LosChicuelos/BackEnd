class RemoveApplicantFromAlliances < ActiveRecord::Migration[5.1]
  def change
    remove_reference :alliances, :applicant, foreign_key: true
  end
end

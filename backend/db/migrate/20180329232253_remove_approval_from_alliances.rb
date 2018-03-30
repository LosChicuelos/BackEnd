class RemoveApprovalFromAlliances < ActiveRecord::Migration[5.1]
  def change
    remove_reference :alliances, :approval, foreign_key: true
  end
end

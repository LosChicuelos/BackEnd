class AddApprovalToAlliances < ActiveRecord::Migration[5.1]
  def change
    add_reference :alliances, :approval
  end
end

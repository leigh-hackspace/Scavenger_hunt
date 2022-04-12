class AddReferencesToItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :hunters, :bonus_item
  end
end

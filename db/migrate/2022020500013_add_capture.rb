# frozen_string_literal: true

class AddCapture < ActiveRecord::Migration[6.1]
  def change
    create_table :hunters_items, id: false do |t|
      t.belongs_to :hunter
      t.belongs_to :item
    end
  end
end

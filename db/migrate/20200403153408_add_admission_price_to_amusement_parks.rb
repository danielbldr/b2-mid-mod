class AddAdmissionPriceToAmusementParks < ActiveRecord::Migration[5.1]
  def change
    add_column :amusement_parks, :admission_price, :integer
  end
end

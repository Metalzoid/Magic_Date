class AddCommentToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :comment, :string
  end
end

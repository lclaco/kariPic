class AddFeelingsSituationsToPhotographs < ActiveRecord::Migration[7.0]
  def change
    add_column :photographs, :feelings_situations, :string
  end
end

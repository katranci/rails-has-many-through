class CreateBookShelves < ActiveRecord::Migration
  def change
    create_table :book_shelves do |t|
      t.references :book, index: true
      t.references :shelf, index: true

      t.timestamps
    end
  end
end

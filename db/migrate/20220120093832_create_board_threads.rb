class CreateBoardThreads < ActiveRecord::Migration[6.1]
  def change
    create_table :board_threads do |t|
      t.string :title
      t.belongs_to :user
      t.string :username
      t.belongs_to :board
      t.text :content
      t.timestamps
    end
  end
end

class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :body
      t.string :author

      t.timestamps
    end
  end
end

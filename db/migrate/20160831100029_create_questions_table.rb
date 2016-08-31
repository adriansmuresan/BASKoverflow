class CreateQuestionsTable < ActiveRecord::Migration
  def change
       create_table  :questions do |t|
        t.string    :title, null: false
        t.string    :body
        t.integer   :author_id

        t.timestamps(null: false)
    end
  end
end

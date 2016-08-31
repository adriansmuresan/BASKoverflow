class CreateAnswersTable < ActiveRecord::Migration
  def change
     create_table  :answers do |t|
        t.string    :description, null: false
        t.integer   :question_id
        t.integer   :answerer_id

        t.timestamps(null: false)
    end
  end
end

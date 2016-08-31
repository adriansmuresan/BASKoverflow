class CreateVotesTable < ActiveRecord::Migration
  def change
     create_table  :votes do |t|
        t.integer     :value
        t.references  :votable, polymorphic: true, index: true
        t.integer     :voter_id

        t.timestamps(null: false)
    end
  end
end

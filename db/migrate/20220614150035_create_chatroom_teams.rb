class CreateChatroomTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :chatroom_teams do |t|
      t.string :name
      t.references :team, null: false, foreign_key: truerails g model Message content chatroom:references user:references


      t.timestamps
    end
  end
end

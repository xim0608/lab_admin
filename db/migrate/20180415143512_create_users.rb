class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string    :email,               null: false
      t.string    :crypted_password,    null: false
      t.string    :password_salt,       null: false
      t.string    :persistence_token,   null: false
      t.integer   :login_count,         null: false, default: 0
      t.integer   :failed_login_count,  null: false, default: 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :perishable_token,    null: false
      t.string    :slack_uid

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :perishable_token
  end
end

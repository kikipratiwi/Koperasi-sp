class DeviseCreateOfficials < ActiveRecord::Migration[5.0]
  def change
    create_table :officials do |column|
      ## Database authenticatable
      column.string :username,           null: false, default: ""
      column.string :email,              null: false, default: ""
      column.string :encrypted_password, null: false, default: ""

      ## Recoverable
      column.string   :reset_password_token
      column.datetime :reset_password_sent_at

      ## Rememberable
      column.datetime :remember_created_at

      ## Trackable
      column.integer  :sign_in_count, default: 0, null: false
      column.datetime :current_sign_in_at
      column.datetime :last_sign_in_at
      column.string   :current_sign_in_ip
      column.string   :last_sign_in_ip

      ## Confirmable
      # column.string   :confirmation_token
      # column.datetime :confirmed_at
      # column.datetime :confirmation_sent_at
      # column.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # column.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # column.string   :unlock_token # Only if unlock strategy is :email or :both
      # column.datetime :locked_at

      ## Profile
      column.string :name,         null: false
      column.text   :address,      null: false
      column.string :birthplace,   null: false
      column.date   :birthdate,    null: false
      column.string :phone_number, null: false
      column.string :info,         null: true

      column.timestamps null: false
    end

    add_index :officials, :username,             unique: true
    add_index :officials, :email,                unique: true
    add_index :officials, :reset_password_token, unique: true
    # add_index :officials, :confirmation_token,   unique: true
    # add_index :officials, :unlock_token,         unique: true
  end
end

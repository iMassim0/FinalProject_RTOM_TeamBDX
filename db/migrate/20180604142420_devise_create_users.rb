# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string :username,           null: false, default: ""
      t.string :firstname,          default: ""
      t.string :lastname,           default: ""
      t.string :country,            default: ""
      t.string :avatar,             default: ""
      t.string :del_firstname,      default: ""
      t.string :del_lastname,       default: ""
      t.string :del_address,        default: ""
      t.string :del_zipcode,        default: ""
      t.string :fac_firstname,      default: ""
      t.string :fac_lastname,       default: ""
      t.string :fac_address,        default: ""
      t.string :fac_zipcode,        default: ""
      t.string :phonenumber,        default: ""
      t.date :birthday,             default: ""
      t.boolean :is_admin,          default: false


      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end
    add_index :users, :username,             unique: true
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end

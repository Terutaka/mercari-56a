# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      # ユーザー新規作成時は以下のをコメントアウト解除してください
      t.integer :user_detail_id, foreign_key: true
      t.string  :nickname,               null: false, unique: true, index: true
      t.string  :last_name
      t.string  :first_name
      t.string  :last_name_kana
      t.string  :first_name_kana
      t.integer  :birthday
      t.text    :profile

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end

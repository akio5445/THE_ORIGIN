class CreateUserMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_members do |t|
      t.string :email, null: false                      # メールアドレス
      t.string :name, null: false                       # 名前
      t.string :hashed_password                         # パスワード
      t.boolean :suspended, null: false, default: false # 無効フラグ

      t.timestamps
    end

    add_index :user_members, "LOWER(email)", unique: true
    add_index :user_members, [ :name ]
  end
end
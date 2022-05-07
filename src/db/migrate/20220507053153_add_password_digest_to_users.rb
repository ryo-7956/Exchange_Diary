class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change
    # リスト6.32:usersテーブルにpassword_digestカラムを追加するマイグレーション
    add_column :users, :password_digest, :string
  end
end

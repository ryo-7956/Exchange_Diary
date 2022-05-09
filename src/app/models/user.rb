class User < ApplicationRecord
    # (https://railstutorial.jp/chapters/modeling_users?version=4.2#cha-modeling_users)
    
    # リスト6.42:before_saveコールバックの別の実装
    before_save { email.downcase! }
    
    # リスト6.31:email属性を小文字に変換してメールアドレスの一意性を保証する
    # before_save { self.email = email.downcase }

    # リスト6.16: name属性に長さの検証を追加する
    validates :name,  presence: true, length: { maximum: 50 }

    # リスト6.21:メールフォーマットを正規表現で検証する
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # リスト6.43:有効なメールアドレスかどうか (ドットが２つ以上連続するかどうか) を検証する正規表現
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    # リスト6.24:メールアドレスの一意性を検証する
    # uniqueness: true
    # リスト6.26:メールアドレスの大文字小文字を無視した一意性の検証 
    uniqueness: { case_sensitive: false }

    # リスト6.34:Userモデルにhas_secure_passwordを追加する
    has_secure_password

    # リスト6.39:セキュアパスワードの完全な実装 
    validates :password, presence: true, length: { minimum: 6 }
end

require "test_helper"

class UserTest < ActiveSupport::TestCase

  # リスト6.5:有効なUserかどうかをテストする(https://railstutorial.jp/chapters/modeling_users?version=4.2#cha-modeling_users)
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
    password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  # リスト6.7:name属性にバリデーションに対するテスト
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  # リスト6.11:email属性の検証に対するテスト
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  # リスト6.14:nameの長さの検証に対するテスト
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  # リスト6.18:有効なメールフォーマットをテストする
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  # リスト6.19:メールフォーマットの検証に対するテスト
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  # リスト6.23:重複するメールアドレス拒否のテスト
  test "email addresses should be unique" do
    duplicate_user = @user.dup

    # リスト6.25:大文字小文字を区別しない、一意性のテスト
    duplicate_user.email = @user.email.upcase

    @user.save
    assert_not duplicate_user.valid?
  end

  # リスト6.38:パスワードの最小文字数をテストする
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  

end

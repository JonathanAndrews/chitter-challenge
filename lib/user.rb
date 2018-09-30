require 'data_mapper'
class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, String
  property :username, String
  property :name, String

  has n, :peeps

  def self.make(email:, password:, username:, name:)
    return false unless new_email?(email)
    return false unless new_username?(username)
    create(email: email, password: password, username: username, name: name)
  end

  def self.sign_in(username:, password:)
    return false unless username_exist?(username)
    return false unless password_correct?(username, password)
    @current_user = first(username: username)
  end

  def self.sign_out
    @current_user = nil
  end

  def self.current_user
    @current_user
  end

  def self.new_email?(email)
    count(email: email).zero?
  end

  def self.new_username?(username)
    count(username: username).zero?
  end

  def self.username_exist?(username)
    count(username: username) != 0
  end

  def self.password_correct?(username, password)
    user = first(username: username)
    user.password == password
  end

end

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new({
      first_name: "josh",
      last_name: "brookstone",
      email: "joshbrookstone@gmail.com",
      password: "realpwd",
      password_confirmation: "realpwd"
      })
    @user.save!
  end
  describe 'Validations' do
    it 'should validate this user is is present when data is correct' do
      expect(@user.first_name).to be_present
    end

    it 'should not validate this user when passwords dont match' do
      @user.password_confirmation = "fakepwd"
      @user.valid?
      expect(@user).to_not be_valid
    end

    it 'should not allow another user if the emails are the same' do
      @user2 = User.new({
        first_name: "josh",
        last_name: "brookstone",
        email: "joshBrookstone@gmail.com",
        password: "realpwd",
        password_confirmation: "realpwd"
      })
      expect(@user2).to_not be_valid
    end

    it 'should validate password must be atleast 3 characters minimum' do
      @user2 = User.new({
        first_name: "josh",
        last_name: "brookstone",
        email: "joshBrookstone@gmail.com",
        password: "pw",
        password_confirmation: "pw"
      })
      expect(@user2).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
   it 'should validate a successful login with the right credentials' do
    isValid = User.authenticate_with_credentials(@user.email, @user.password)
    expect(isValid).to be_truthy
   end

   it 'should validate a unsuccessful login with the wrong credentials' do
    isValid = User.authenticate_with_credentials(@user.email," @user.password")
    expect(isValid).to be_falsy
   end

   it 'should validate that spaces before and/or after email/password are removed' do
    isValid = User.authenticate_with_credentials(" #{@user.email} ", " #{@user.password} ")
    expect(isValid).to be_truthy
   end

   it 'should validate that email is case sensitive' do
    isValid = User.authenticate_with_credentials("joshBrookstone@gmail.com", @user.password)
    expect(isValid).to be_truthy
   end

   
  end

end

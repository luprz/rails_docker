require 'rails_helper'

RSpec.describe User, type: :model do
  context "invalid" do
    it "when email is blank" do
      user = User.new(email: nil, password: "12345678", password_confirmation: "12345678")
      expect(user).not_to be_valid
    end

    it "when password is blank" do
      user = User.new(email: "luis.prz@keppler.com", password: nil, password_confirmation: "12345678")
      expect(user).not_to be_valid
    end

    it "when password confirmation is blank" do
      user = User.new(email: "luis.prz@keppler.com", password: "12345678", password_confirmation: nil)
      expect(user).not_to be_valid
    end

    it "when password not match with password_confirmation" do
      user = User.new(email: "luis.prz@keppler.com", password: "12345678", password_confirmation: "123456789")
      expect(user).not_to be_valid
    end

    it "when password is less than 6 characters" do
      user = User.new(email: "luis.prz@keppler.com", password: "123", password_confirmation: "123")
      expect(user).not_to be_valid
    end

    it "when the password is longer than 10 characters" do
      user = User.new(email: "luis.prz@keppler.com", password: "123456789102", password_confirmation: "123456789102")
      expect(user).not_to be_valid
    end
  end

  context "valid" do
    before(:all) do
      @user = User.new(email: "luis.prz@keppler.com", password: "12345678", password_confirmation: "12345678")
    end

    it "when the object is correct" do
      expect(@user).to be_valid
    end
  end

  context "#Role" do

    before(:all) do
      @user = User.new(email: "luis.prz@keppler.com", password: "12345678", password_confirmation: "12345678")
    end

    it "When a user is created must have a default client role" do
      expect(@user.role).to eq("client")
    end
  end

end

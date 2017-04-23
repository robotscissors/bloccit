require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value("user@bloccit.com").for(:email) }

  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
      it "should have name and email attributes" do
        expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
      end
  end

  describe "invalid user" do
    let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
    let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }

    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_name).to_not be_valid
    end

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end

  describe "capitalization" do
    let(:user_many_names) { User.create!(name: "christopher JoHN BAZIN", email: "user@bloccit1.com", password: "password") }
    let(:user_all_caps) { User.new(name: "CHRISTOPHER BAZIN", email: "user@bloccit2.com", password: "password") }
    let(:user_all_lowercase) { User.new(name: "christopher bazin the third", email: "user@bloccit3.com", password: "password") }


    it "should be properly capilatized" do
      user_many_names.save
      user_all_caps.save
      user_all_lowercase.save

      expect(user_many_names).to have_attributes(name: "Christopher John Bazin", email: "user@bloccit1.com")
      expect(user_all_caps).to have_attributes(name: "Christopher Bazin", email: "user@bloccit2.com")
      expect(user_all_lowercase).to have_attributes(name: "Christopher Bazin The Third", email: "user@bloccit3.com")
    end


  end

end

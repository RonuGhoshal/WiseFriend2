require 'rails_helper'
require 'spec_helper'

describe Mentor do

  it "has a valid factory" do
    FactoryBot.create(:mentor).should be_valid
  end

  it "is invalid without a firstname" do
    FactoryBot.build(:mentor, first_name: nil).should_not be_valid
  end

  it "is invalid without an email" do
    FactoryBot.build(:mentor, email: nil).should_not be_valid
  end

  it "is invalid with a duplicate email" do
    mentor1 = FactoryBot.create(:mentor)
    mentor2 = FactoryBot.build(:mentor, email: mentor1.email)
    mentor2.should_not be_valid
  end
end

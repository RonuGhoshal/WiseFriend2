require 'rails_helper'
require 'spec_helper'

describe Mentor do

  it "has a valid factory" do
    FactoryGirl.create(:mentor).should be_valid
  end

  it "is invalid without a firstname" do
    FactoryGirl.build(:mentor, first_name: nil).should_not be_valid
  end

  it "is invalid without an email" do
    FactoryGirl.build(:mentor, email: nil).should_not be_valid
  end

  it "is invalid with a duplicate email" do
    mentor1 = FactoryGirl.create(:mentor)
    mentor2 = FactoryGirl.build(:mentor)
    mentor2.should_not be_valid
  end


end

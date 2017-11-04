require 'rails_helper'
require 'spec_helper'

describe Mentee do

  it "has a valid factory" do
<<<<<<< HEAD
    FactoryBot.create(:mentee).should be_valid
  end

  it "is invalid without a firstname" do
    FactoryBot.build(:mentee, first_name: nil).should_not be_valid
  end

  it "is invalid without a lastname" do
    FactoryBot.build(:mentee, last_name: nil).should_not be_valid
  end

  it "is invalid without an email" do
    FactoryBot.build(:mentee, email: nil).should_not be_valid
  end

  it "is invalid with a duplicate email" do
    mentee1 = FactoryBot.create(:mentee)
    mentee2 = FactoryBot.build(:mentee)
=======
    FactoryGirl.create(:mentee).should be_valid
  end

  it "is invalid without a firstname" do
    FactoryGirl.build(:mentee, first_name: nil).should_not be_valid
  end

  it "is invalid without a lastname" do
    FactoryGirl.build(:mentee, last_name: nil).should_not be_valid
  end

  it "is invalid without an email" do
    FactoryGirl.build(:mentee, email: nil).should_not be_valid
  end

  it "is invalid with a duplicate email" do
    mentee1 = FactoryGirl.create(:mentee)
    mentee2 = FactoryGirl.build(:mentee)
>>>>>>> 91eaa646f0b740bb3811bbe631cc992e52552d4d
    mentee2.should_not be_valid
  end


end
require 'rails_helper'
require 'spec_helper'

describe Mentee do

  it "has a valid factory" do
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
    mentee2.should_not be_valid
  end


end
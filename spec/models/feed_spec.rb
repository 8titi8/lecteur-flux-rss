require 'rails_helper'

RSpec.describe Feed, type: :model do

  before(:each) do
    @feed = FactoryBot.create(:feed)
  end

  it "has a valid factory" do
    expect(build(:feed)).to be_valid
  end

  context "validations" do
    it "is valid with valid attribues" do
      expect(@feed).to be_a(Feed)
    end

    describe "#title" do
      it { expect(@feed).to validate_presence_of(:title) }
    end

    describe "#url" do
      it { expect(@feed).to validate_presence_of(:url) }
    end
  end

  context "associations" do
    describe "article" do
      it { expect(@feed).to have_many(:articles) }
    end
  end

end

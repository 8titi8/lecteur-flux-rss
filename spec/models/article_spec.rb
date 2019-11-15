require 'rails_helper'

RSpec.describe Article, type: :model do

  before(:each) do
    @article = FactoryBot.create(:article)
  end

  it "has a valid factory" do
    expect(build(:article)).to be_valid
  end

  context "validations" do
    it "is valid with valid attribues" do
      expect(@article).to be_a(Article)
    end

    describe "#title" do
      it { expect(@article).to validate_presence_of(:title) }
    end

    describe "#summary" do
      it { expect(@article).to validate_presence_of(:summary) }
    end

    describe "#date" do
      it { expect(@article).to validate_presence_of(:date) }
    end

    describe "#status" do
      it { expect(@article).to validate_inclusion_of(:status).in_array([true, false]) }
    end

    describe "#link" do
      it { expect(@article).to validate_presence_of(:link) }
    end

  context "associations" do
    describe "feed" do
      it { expect(@article).to belong_to(:feed) }
    end
  end

  context "public instance methods" do
  end


  end

end

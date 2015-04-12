require 'spec_helper'
describe User do
  context "validations" do
    it { should validate_presence_of :email }
    it { should allow_value('hammer@devbootcamp.com').for(:email) }
    it { should_not allow_value('brokenerroremailduhhh').for(:email) }
  end

  context "#name" do
    let(:user) { FactoryGirl.build :user, :email => "kevin@dev.com" }
    it "sets the name as the first part of the email" do
      user.save
      expect(user.reload.name).to eq "kevin"
    end
  end
end
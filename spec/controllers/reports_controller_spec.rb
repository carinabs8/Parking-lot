require 'spec_helper'

describe ReportsController do
  before(:each) do
    FactoryGirl.create(:report)
    UserSession.create Factory.build(:user)
    activate_authlogic
  end
  it "should receive analitic" do
    Report.should_receive(:analitic).and_return([])
    get 'index'
  end
end

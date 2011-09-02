require 'spec_helper'

describe Report do
  it "should return array of reports in a current month and year" do
    report = FactoryGirl.create(:report)
    Report.analitic.should == [report]
  end
end

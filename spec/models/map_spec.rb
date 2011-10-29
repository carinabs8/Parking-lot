require 'spec_helper'

describe Map do
  context "Changes of Map" do
    before(:each) do
      @vacancy = Factory(:vacancy, :status => Vacancy::AVAILABLE)
    end
    
    context "Map not changed" do
      it "should return false if state of vacancy didn't changed" do
        vacancy = @vacancy.id.to_s
        map = Map.find(@vacancy.map_id)
        result = map.changed?([[vacancy, Vacancy::AVAILABLE]])
        result.should be_false
      end
    end
    
    context "Map changed" do
      it "should return true if state of vacancy were changed" do
        vacancy = @vacancy.id.to_s
        map = Map.find(@vacancy.map_id)
        result = map.changed?([[vacancy, Vacancy::BUSY]])
        result.should be_true
      end
      it "should true if the user create a new vacancy" do
        vacancy_new = Factory(:vacancy, :status => Vacancy::AVAILABLE, :map_id => @vacancy.map_id)
        vacancy = @vacancy.id.to_s
        map = Map.find(@vacancy.map_id)
        result = map.changed?([[vacancy, Vacancy::AVAILABLE]])
        result.should be_true
      end
    end
  end
end

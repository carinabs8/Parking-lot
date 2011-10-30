require 'spec_helper'

describe Map do
  context "Did Change the map?" do
    before(:each) do
      @vacancy = Factory(:vacancy, :status => Vacancy::AVAILABLE)
    end
    
    context "Map not changed" do
      it "should return false if state of vacancy is available and didn't change" do
        vacancy = @vacancy.id.to_s
        map = Map.find(@vacancy.map_id)
        result = map.changed?([[vacancy, Vacancy::AVAILABLE]])
        result.should be_false
      end
      it "should return false if state of vacancy is busy and didn't change" do
        @vacancy.status = Vacancy::BUSY
        @vacancy.save!
        vacancy = @vacancy.id.to_s
        map = Map.find(@vacancy.map_id)
        result = map.changed?([[vacancy, Vacancy::BUSY]])
        result.should be_false
      end
      it "should return false if state of vacancy is restricted and didn't change" do
        @vacancy.status = Vacancy::RESTRICTED
        @vacancy.save!
        vacancy = @vacancy.id.to_s
        map = Map.find(@vacancy.map_id)
        result = map.changed?([[vacancy, Vacancy::RESTRICTED]])
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
      it "should true if the user update a vacancy" do
        vacancy = @vacancy.id.to_s
        @vacancy.status = Vacancy::BUSY
        @vacancy.save!
        map = Map.find(@vacancy.map_id)
        result = map.changed?([[vacancy, Vacancy::AVAILABLE]])
        result.should be_true
      end
    end
  end
end

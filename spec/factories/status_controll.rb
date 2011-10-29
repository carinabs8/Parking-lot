FactoryGirl.define do
  factory(:status_controll) do
    timebegin Time.now
    time_end Time.now + 2.hour
    sequence(:cod_arduino){|cod|
      "cod_arduino_#{cod}"
     }
  end
end
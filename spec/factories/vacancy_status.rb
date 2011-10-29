FactoryGirl.define do
  factory(:vacancy_status) do
    sequence(:status){|status|
      "Status_#{status}"
    }
    status_controll
  end
end

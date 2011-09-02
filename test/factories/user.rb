FactoryGirl.define do
  factory :user do
    login "user"
    password "111111"
    password_confirmation "111111"
    email "user@gmail.com"
    single_access_token "k3cFzLIQnZ4MHRmJvJzg"
  end
end
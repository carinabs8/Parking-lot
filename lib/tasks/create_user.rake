namespace :user do
	desc "Create a new user on the system"
	task :create => :environment do
		User.create({login: "carinabs8", email: "carinabs8@meuemail.com", password: "123456", password_confirmation: "123456"})
	end
end
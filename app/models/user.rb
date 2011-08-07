class User < ActiveRecord::Base
  acts_as_authentic
  
  def role?(role)
    self.role.eql? role
  end
end

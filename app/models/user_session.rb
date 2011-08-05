class UserSession < Authlogic::Session::Base
  new_record? ? nil : [self.send(self.class.primary_key)]
end
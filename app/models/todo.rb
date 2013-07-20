class Todo < ActiveResource::Base

  self.site = URLTRACKS
  self.format = :xml

end

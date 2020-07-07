class Todo < ActiveRecord::Base
    validates_presence_of :todo
end

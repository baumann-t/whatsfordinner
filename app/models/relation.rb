class Relation < ApplicationRecord
  belongs_to :follower, class_name: 'User' #The person who follows
  belongs_to :followee, class_name: 'User' #The person that is followed
end

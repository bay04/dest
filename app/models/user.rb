class User < ActiveRecord::Base
include Clearance::User
has_many :suggestions
acts_as_liker
acts_as_follower
end

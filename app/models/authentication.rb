class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :provider, :uid, :user, :user_id
end

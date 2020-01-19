require_dependency 'wobauth/concerns/models/user_concerns'
module Wobauth
  class User < ActiveRecord::Base
    include UserConcerns

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable
  end
end

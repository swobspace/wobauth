module Wobauth
  class User < ActiveRecord::Base
    # dependencies within wobauth models
    include Wobauth::Concerns::Models::User

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
  end
end

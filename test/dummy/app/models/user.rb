class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authorities, as: :authorizable, dependent: :destroy
  has_many :roles,       through: :authorities
  has_many :memberships, dependent: :destroy
  has_many :group_roles, through: :groups, source: :roles
  has_many :groups, -> { uniq }, through: :memberships

  def to_s
    email
  end
end

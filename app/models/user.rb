class User < ApplicationRecord
  extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  enumerize :role, in: %i[user admin], default: :user, predicates: true, i18n_scope: 'user.roles'

  validates_presence_of :name
end

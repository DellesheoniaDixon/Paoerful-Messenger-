class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :username, uniqueness: true, presence: true
    validates_uniqueness_of :username

    scope :all_except, -> (user) {where.not(id: user)}
    
    has_many :messages

    after_create_commit { broadcast_append_to "users" }

end

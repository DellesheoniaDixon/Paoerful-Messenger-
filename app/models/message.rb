class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  before_create :confirm_participant

  after_create_commit { broadcast_append_to self.room }

  has_one_attached :image, :dependent => :destroy

  def confirm_participant
    if self.room.is_private
      is_participant = Participant.where(user_id: self.user.id, room_id: self.room.id).first
      throw :abort unless is_participant
    end
  end

end

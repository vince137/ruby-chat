require 'securerandom'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  before_save :generate_token

  def email_required?
    false
  end

  def email_changed?
    false
  end


  private
    def generate_token
        self.api_token = SecureRandom.hex(13)
    end
end

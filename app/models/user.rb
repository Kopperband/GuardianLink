class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { volunteer: 0, non_profit: 1, admin: 2 }

  # Set a default role after initializing a user
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :volunteer
  end

end

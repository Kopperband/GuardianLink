class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { Volunteer: 0, Non_Profit: 1, Admin: 2 }

  # Set a default role after initializing a user
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :Volunteer
  end

end

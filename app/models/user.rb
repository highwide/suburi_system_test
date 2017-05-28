class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: :new_or_changing_password?
  validates :password, confirmation: true, if: :new_or_changing_password?
  validates :password_confirmation, presence: true, if: :new_or_changing_password?

  validates :email, uniqueness: true

  private

  def new_or_changing_password?
    new_record? || changes[:crypted_password]
  end
end

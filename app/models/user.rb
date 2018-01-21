class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable, :rememberable
  attr_accessor :code

  has_one :secret_code, dependent: :nullify
  validate :check_if_code_exist?, on: :create

  after_create :assign_secret_code, unless: :admin?

  def admin?
    self.role.to_s == 'admin'
  end

  private

  def check_if_code_exist?
    return if code.blank?
    if not SecretCode.exists?(user_id: nil, code: code)
      errors.add(:secret_code, I18n.t('errors.messages.invalid'))
    end
  end

  def assign_secret_code
    secret_code = SecretCode.find_by(code: code)
    secret_code.update_column(:user_id, id)
  end

end

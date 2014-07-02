class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:instagram,:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  attr_accessible :address, :token

  has_many :orders
  has_many :photos

    has_many :authentications


    validates :first_name, presence: true
      validates :email, presence: true

  def self.find_for_oauth(kind, auth, signed_in_user=nil)
    puts auth.to_s
    case kind
    when "instagram"
      if user = signed_in_user || Customer.find_by_first_name(auth.info.name)
        user.first_name = auth.info.name if user.first_name.blank?
        # user.image = auth.info.image if user.image.blank?
        user.save
      # elsif auth_record = Authentication.find_by_provider_and_uid(auth.provider, auth.uid)
      #   return auth_record.user
      else
        user = Customer.create do |user|
          user.first_name = auth.info.name
          user.email = auth.info.email
          # user.image = auth.info.image
          user.password = Devise.friendly_token[0,20]
          user.skip_confirmation! # don't require email confirmation
        end
      end
    when "google", "github"
      raise NotImplementedError, "Facebook, Google, Github coming soon"
    end


    if user.persisted?
      user.authentications.where(auth.slice(:provider, :uid)).first_or_create!
    end

    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session["devise.instagram_data"] || session["devise.github_data"] || session["devise.google_data"]
        user.first_name = auth.info.name if user.first_name.blank?
        user.email = "yo" if user.email.blank?
        # user.image = auth.info.image if user.image.blank?
        user.skip_confirmation! # don't require email confirmation
      end
    end
  end

end

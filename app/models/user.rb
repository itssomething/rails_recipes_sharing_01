class User < ApplicationRecord
  has_many :favors, as: :targetable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :favorite_recipes, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: "follower_id",
    dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: "followed_id",
    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :comments, dependent: :destroy

  scope :top_user, ->{joins(:recipes).group(:id).order("count(recipes.id)
   DESC").limit(Settings.num_top_user)}

  mount_uploader :avatar, AvatarUploader

  before_save :email_downcase

  validates :name, presence: true,
            length: {maximum: Settings.name_max_length}
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            length: {maximum: Settings.email_max_length},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password, presence: true,
            length: {minimum: Settings.password_min_length}, allow_nil: true
  validate :avatar_size
  has_secure_password

  def current_user? user
    self == user
  end

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  def feed
    @recipes = Recipe.feed(following_ids, id).desc
  end

  def liked? recipe
    @rela = Favor.rela self, recipe
    @rela.present?
  end

  private

  def email_downcase
    email.downcase!
  end

  def avatar_size
    return unless avatar.size > Settings.max_file.megabytes
    errors.add :avatar, I18n.t(".over_limit_file_size")
  end
end

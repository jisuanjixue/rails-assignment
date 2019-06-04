class Course < ApplicationRecord
  
  belongs_to :user
  belongs_to :category, :optional => true
  belongs_to :location, :optional => true

 
  has_many :votes, dependent: :destroy 
  has_many :numbers, dependent: :destroy 

 
  mount_uploaders :images, CourseImageUploader
  serialize :images, JSON
  
  
  default_scope -> { order(created_at: :desc) }
  
  validates_presence_of :user_id, :random_id
  
  validates_format_of :random_id, with: /\A[a-z0-9\-]+\z/, message: "invalidate"
  
  scope :by_category, ->(t){ where( :category_id => t ) }
  scope :by_location, ->(t){ where( :location_id => t ) }
  
  validates_uniqueness_of :random_id, message: "no unquie"
  
  before_validation :generate_random_id, on: :create

 
  def to_param
    self.random_id
   end

  protected

  
 def generate_random_id
  self.random_id ||= SecureRandom.uuid
 end
end

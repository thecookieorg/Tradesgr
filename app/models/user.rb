class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: '152x152#' }  
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/ 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates_uniqueness_of :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :certifications
end

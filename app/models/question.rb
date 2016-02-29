class Question < ActiveRecord::Base
    belongs_to :user
    has_many :answers, dependent: :destroy
    
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    validates_presence_of :title, :description
end

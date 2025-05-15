class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Pagination
  
  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :created_at, type: Time, default: ->{ Time.now }
  field :updated_at, type: Time, default: ->{ Time.now }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  index({ email: 1 }, { unique: true })
end
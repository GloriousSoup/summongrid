#This is basically slugs. We do authentication-by-secret-url because convenience and reliability matter more than security here. 
module UniqueKey
  extend ActiveSupport::Concern

  included do
    validates :key, presence:true, uniqueness:true
    before_validation :assign_key
    before_save :assign_key
  end

  def assign_key
    self[:key] ||= (0...10).map { (65 + rand(26)).chr }.join
  end

  def to_param
    key
  end

end

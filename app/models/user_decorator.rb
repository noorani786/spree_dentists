module Spree
  Spree::User.class_eval do
    attr_accessor :is_dentist
    attr_accessible :dental_license_number, :is_dentist
        
    validates :dental_license_number, uniqueness: true, if: :is_dentist
    validates :dental_license_number, presence: true, if: :is_dentist
    
    before_validation :unverify, if: :dental_license_number_changed?
    
    def unverify
      self.verified = false
    end
  end
end
# -*- encoding : utf-8 -*-
module User::Mobile

  module ClassMethods
    def authenticate_with_mobile_identity(ident, mobile_salt)
      find_by(mobile_identity: encrypt(ident, mobile_salt))
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def update_mobile_identity!(identity, mobile_salt)
    raise "mobile_salt should be set" if mobile_salt.blank?
    self.mobile_identity = identity.blank? ? nil : self.class.encrypt(identity, mobile_salt)
    self.save!
  end

  def clear_mobile_identity!
    self.mobile_identity = nil
    self.save!
  end
end
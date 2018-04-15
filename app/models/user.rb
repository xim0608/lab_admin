class User < ApplicationRecord
  acts_as_authentic do |c|
    c.login_field = :email
    c.validates_uniqueness_of_email_field_options({ value: true })
    c.merge_validates_length_of_password_field_options({ minimum: 6 })
  end
end

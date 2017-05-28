ActiveRecord::Base.transaction do
  # enable to login with test@example.com/hogehoge
  user = User.find_or_initialize_by(
    email: 'test@example.com',
    crypted_password: '$2a$10$Qf8isb9NbJgWstWepbvZiOXXRgE8nvZVJUH51fwQtjQM44/t0.wyO',
    salt: 'RbvkyAJsHr-DczsuVnDD'
  )
  user.save!(validate: false)
end

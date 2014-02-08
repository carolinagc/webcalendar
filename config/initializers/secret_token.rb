secret = Rails.env.production? ? ENV['SECRET_TOKEN'] : ('x' * 30)
Webcalendar::Application.config.secret_key_base = secret

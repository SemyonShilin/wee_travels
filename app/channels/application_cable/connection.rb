module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      data = cookies.encrypted
      if verified_user ||= data[:owner_type].safe_constantize.find_by(id: data[:owner_id])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end

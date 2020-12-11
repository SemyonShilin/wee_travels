module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.class.to_s, current_user.id
    end

    private

    def find_verified_user
      # data = cookies.encrypted
      params = request.params

      if verified_user ||= params[:owner_type].safe_constantize.find_by(id: params[:owner_id])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end

class EventsController < ApplicationController

  def index
    @events = @current_user.try(:access_token) ? Koala::Facebook::API.new(@current_user.access_token).get_object('events') : []
  end
end

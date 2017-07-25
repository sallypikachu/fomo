class EventsController < ApplicationController

  def index
    @events = current_user.access_token ? Koala::Facebook::API.new(current_user.access_token).get_object('/me/events?time_filter=past').select {|x| Date.parse(x['start_time']) > Date.today && Date.parse(x['end_time']) < (Date.today + 60.days) } : []
  end
end

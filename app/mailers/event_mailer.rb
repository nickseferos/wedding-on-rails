class EventMailer < ApplicationMailer
  def notifications(rsvps, photos)
    @rsvps = rsvps
    @photos = photos
    mail to: "nick.seferos@gmail.com", subject: "Notification from seferos.com"
  end
end

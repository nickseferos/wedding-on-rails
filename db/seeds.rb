def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}"))
end

event = Event.create!({
  date: Date.parse("2018-09-15"),
  location: "Port of Anacortes, Anacortes, WA",
  active: true,
  title: "Nicholas & Denali",
  partner_one: "Denali",
  partner_two: "Nicholas",
  venue_name: "Port of Anacortes",
  venue_address_line_one: "100 Commercial Ave",
  venue_address_city: "Anacortes",
  venue_address_state: "Washington",
  venue_address_zip: "98221",
  venue_address_country: "United States",
  venue_body: """
Both the ceremony and reception will be held at The Port of Anacortes - Transit Shed located in the heart of Anacortes.
We're planning for an outdoor ceremony on the venues beautiful pier.
  """,
  venue_directions: """
**From Seattle:** Take I5 North to SR20, follow that to the end of time. *appox 1hr 30min*.

**From elsewhere:** To get directions [click here](https://www.google.com/maps/place/Port+of+Anacortes/@48.521744,-122.6150107,17z/data=!3m1!4b1!4m5!3m4!1s0x548579de2a088a69:0xdb55ebe2bd0a821f!8m2!3d48.521744!4d-122.612822).

The Transit Shed is located at the port of Anacortes in Anacortes Washington. The venue is located at the end of Commerical Ave.
This venue is an active pier and an old warehouse. Heels are not reccommended, flats preferred.
  """
})

venue_photos = VenuePhoto.create!([
  { event_id: event.id, file: seed_image("venue_photos/1.jpg") },
  { event_id: event.id, file: seed_image("venue_photos/2.jpg") },
  { event_id: event.id, file: seed_image("venue_photos/3.jpg") },
  { event_id: event.id, file: seed_image("venue_photos/4.jpg") }
])

event.primary_venue_photo = venue_photos.last.id
event.save!

butlers = Group.create!({
  event_id: event.id
})

owens = Group.create!({
  event_id: event.id
})

ian = Guest.create!({
  name: "Ian Butler",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: butlers.id,
  event_id: event.id
})

mary = Guest.create!({
  name: "Mary Butler",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: butlers.id,
  event_id: event.id
})

bryan = Guest.create!({
  name: "Bryan Owen",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: owens.id,
  event_id: event.id
})

joyce = Guest.create!({
  name: "Joyce Owen",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: owens.id,
  event_id: event.id
})

leon = Guest.create!({
  name: "Leon Butler",
  invited_to_ceremony: true,
  invited_to_evening: true,
  event_id: event.id
})

leons_guest = Guest.create!({
  rsvp: false,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: leon.group.id,
  event_id: event.id
})

debug = Group.create!({
  event_id: event.id
})

no_rsvp = Guest.create!({
  name: "no_rsvp",
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: debug.id,
  event_id: event.id
})

rsvp_false = Guest.create!({
  name: "rsvp_false",
  invited_to_ceremony: true,
  invited_to_evening: true,
  event_id: event.id,
  group_id: debug.id,
  rsvp: false
})

rsvp_true = Guest.create!({
  name: "rsvp_true",
  invited_to_ceremony: true,
  invited_to_evening: true,
  event_id: event.id,
  group_id: debug.id,
  rsvp: true
})

guest_no_rsvp = Guest.create!({
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: debug.id,
  event_id: event.id
})

guest_rsvp_false = Guest.create!({
  invited_to_ceremony: true,
  invited_to_evening: true,
  event_id: event.id,
  group_id: debug.id,
  rsvp: false
})

guest_rsvp_true = Guest.create!({
  invited_to_ceremony: true,
  invited_to_evening: true,
  event_id: event.id,
  group_id: debug.id,
  rsvp: true
})

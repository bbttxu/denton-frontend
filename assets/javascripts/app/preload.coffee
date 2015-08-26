define ['app/api', 'postal', 'moment'], (API, Postal, moment)->

  channel = Postal.channel()

  lastChance = ()->
    channel.publish "get.date", moment().format('YYYY-MM-DD')
    channel.publish "get.calendar"
    channel.publish "get.venues"

  setTimeout lastChance, 1000

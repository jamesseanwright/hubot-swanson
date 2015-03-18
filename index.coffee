# Description:
#   A Hubot script for retrieving Ron Swanson quotes
#
# Commands:
#   hubot swanson me - output a quote
#
# Author:
#   James Wright (jamesseanwright)

module.exports = (robot) ->
  robot.respond /swanson me/i, (msg) ->
    robot.http 'http://ron-swanson-quotes.herokuapp.com/quotes'
      .get (err, res, body) ->
        if err
          msg.send 'Couldn't retrieve a quote from the server'
          return

        try
          msg.send '"' + JSON.parse(body).quote + '"'
        catch ex
          msg.send 'Invalid JSON returned by server'

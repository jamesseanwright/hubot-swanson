# Description:
#   A Hubot script for retrieving Ron Swanson quotes
#
# Commands:
#   hubot swanson me - output a quote
#   hubot swanson bomb - output up to <maxBombQuotes> quotes
#
# Author:
#   James Wright <james@jamesswright.co.uk>

maxBombQuotes = 5;

module.exports = (robot) ->
  robot.respond /swanson me/i, (msg) ->
    robot.http("http://ron-swanson-quotes.herokuapp.com/v2/quotes")
      .get() (err, res, body) ->
        if err
          msg.send "Couldn't retrieve a quote from the server"
          return

        try
          quote = JSON.parse(body)[0]
          msg.send "\"#{quote}\""
        catch ex
          console.log(ex)
          msg.send "Invalid response returned by server"

  robot.respond /swanson bomb/i, (msg) ->
    robot.http("http://ron-swanson-quotes.herokuapp.com/v2/quotes/#{maxBombQuotes}")
      .get() (err, res, body) ->
        if err
          msg.send "Couldn't retrieve a quote from the server"
          return

        try
          quotes = JSON.parse(body).map (quote) -> "\"#{quote}\""
          msg.send quotes.join "\n"
        catch ex
          console.log(ex)
          msg.send "Invalid response returned by server"
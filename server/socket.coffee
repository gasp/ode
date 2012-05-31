words = require("./words")
_ = require("underscore")

exports.setup = (server) ->
  io = require('socket.io').listen(server)
  io.sockets.on "connection", (socket) ->
    socket.emit "words", words
    socket.on "move", (data) ->
      word = _.find words, (word) ->
        word.word is data.word

      word.location = data.location

      socket.broadcast.emit("move", data)
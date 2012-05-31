express = require("express")
app = express()
server = app.listen(process.env['app_port'] || 3000)

app.configure () ->
  app.set 'view engine', 'hbs'
  app.set 'views', "#{__dirname}/views"

  app.use express.logger('tiny')

  app.use express.methodOverride()
  app.use express.bodyParser()
  
  app.use express.static("#{__dirname}/../public")

app.get "/", (req, res) ->
  res.render "index"

# set up sockets here
require("./socket").setup server
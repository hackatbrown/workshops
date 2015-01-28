var express = require('express');
var mongoose = require('mongoose');
var bodyParser = require('body-parser');

/* DATABASE CONFIGURATION */

/*
 * Here we connect as a demo user to our demo database. If you want control
 * over your Llo's data, you can create your own database for free at 
 * mongolab.com. Then, mongolab will give you a seperate URL to connect to.
 */
mongoose.connect('mongodb://user:abc123@ds053130.mongolab.com:53130/llo');

/*
 * A schema is like a contract of how we will represent a post in our database.
 */
var PostSchema = mongoose.Schema({
  content: String,
});

/*
 * A model is the API for a mongoose schema. A schema defines how the data is
 * structured. A model lets us interact with the data. With a model we can
 * query and save data to our database.
 */
var Post = mongoose.model('Post', PostSchema);


/* SERVER CONFIGURATION */

var app = express();

/*
 * Sets the template rendering engine in of express to be embedded javascript,
 * and for it to look in the ./views/ directory for the templates.
 */
app.set('view engine', 'ejs');
app.set('views', __dirname + '/views');

/*
 * Here we define middleware, things to do before moving on to our own request
 * handlers. All of these app.*'s are done in the order that a request would be
 * processed, so order matters! Here we:
 */

/*
 * Defines the actions we take when the user hits our main page.
 *
 * Step 1: Search through our database for all Posts that match our query
 * using Posts.find({}, function(err, posts) { <do something> })
 *
 * Step 2: Render these posts inside the find callback function using 
 * res.render('home', { <param1> : <value1> })
 */
app.get('/', function (req, res) {
  // Put your code for your homepage here.
});

/*
 * Extract url encoded parameters on requests and put it in req.body
 */
app.use(bodyParser.urlencoded({extended: false}));

/*
 * Defines the actions we take when the user submits a post 
 */
app.post('/submit', function (req, res) {
  // Step 1: read the content field sent by the POST request
  var content = req.body.content;
  // Step 2: create a new Post object, var post = new Post({ <param1> : <value1>}) 

  // Step 3: save the post to our database using the post.save() method.

  // Step 4: Redirect the user back to our home page using res.redirect(<url>)
});

/*
 * Check if the request matches a static file in /public/ if so, then simply
 * serve it.
 */
app.use('/', express.static(__dirname + '/public'));

/*
 * Start up the server and listen to the environment's PORT variable,
 * (useful for deployment) or a default port, 3000.
 */
var port = process.env.PORT || 3000;
var server = app.listen(port, function () {
  console.log('Llo listening at http://localhost:' + port);
});

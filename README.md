# GamrBuddy

This app is built using [ruby on rails][rails-ref].

back-end deployed @ https://empire-co.herokuapp.com/api

For a UI experience that consumes our api check out [EmpireCo App][front-end-app], which uses [AngularJS][angular-ref] as a front-end JavaScript framework. Also, you can checkout the Github [here][front-end-repo].


## Motivation

Empire Co. was created because of shared our interest in developing the necassary skills required to create a modern web store. These skills can potentially open us to strategic roles with client retailers both large and independent.

## Model Schema


## Development / Installation setup

The following commands are assuming you already have node installed on your machine. If you dont you can download Node.js [here][nodejs].

<details>
<summary>
  [node.js][node.js-blog] blog blurb.
</summary>
```
An important thing to realize is that Node is not a webserver. By itself it doesn't do anything. It doesn't work like Apache. There is no config file where you point it to you HTML files. If you want it to be a HTTP server, you have to write an HTTP server (with the help of its built-in libraries). Node.js is just another way to execute code on your computer. It is simply a JavaScript runtime.
```
</details>

___
<p>Some dependencies used in the api and what they are being used for in the app.</p>

<details>
  <summary>
    [cookie-session][cookie-session-ref]
  </summary>
  ```js
    Confusion...
  ```
</details>

<details>
  <summary>
    [morgan][morgan-ref]
  </summary>
  <br>
  ```js
    // server.js
    var logger = require('morgan');
    app.use(logger('dev'));

    //Concise output colored by response status for development use. The :status token will be colored red for server error codes, yellow for client error codes, cyan for redirection codes, and uncolored for all other codes.

    // CONSOLE.LOG: :method :url :status :response-time ms - :res[content-length]

    // EXAMPLE: GET /api 200 6.823 ms - 43
  ```
</details>
<details>
  <summary>
    [passport-local-mongoose]
  </summary>
  <br>
  ```js
    // models/user.js
    var passportLocalMongoose = require('passport-local-mongoose');
    UserSchema.plugin(passportLocalMongoose, {usernameField: 'email'});

    // Plugin Passport-Local Mongoose into your User schema
    // Use options to specify an alternative usernameField
  ```
</details>

___
OS X & Linux:

```sh
# install app dependencies
$ npm install
```
```sh
# create database and seed locally
$ node db/seed.js
```
```sh
# start server
$ nodemon
```
If there are no errors in the terminal, you can now navigate in our browser to <http://localhost:8080/api> to interact with our app.

## Useage

Here is documentation on accessing our api. If you would like to test all the RESTful routes you can download [Postman][postman-ref], an powerfull HTTP client.

| URL(s) | / | /login | /logout | /products | /products/:id | /users | /users/:id |
| --- | --- | --- | --- | --- | --- | --- | --- |
| **Method(s)** | `GET` | `POST` | `POST` | `GET` `POST` | `GET` `PUT` `DELETE` | `GET` `POST` | `GET` `PUT` `DELETE` |
| **USE** | Welcome User | User login | User Logout | `GET` Show all Products `POST` Create a Product |  | | |
| **Success Response** | Code: (200)<br> Content: { message: 'WELCOME TO THE EMPIRE CO API!' } | Code: (200)<br> Content: { user: (all key:pair from user model and passport)} | Code: (200)<br> Content: { message: "Logged Out!, "user": null } | `GET` Code: (200)<br> Content: [products]<br> `POST` Code: (200)<br> Content: [product] |  | | |
| **Error Response** | | | | | | | | |

## Code Example

Using .register instead of .create when creating a new instance of a user. This section of code gave us some trouble because we didnt realize that the register method tasks a callback as an argument. We were using a .then and .catch

```js
router.route('/users')
  // register (create)
  .post(function(req, res, next) {
    var user = new User(req.body.user);
    // register(user, password, cb) Convenience method to register a new user instance with a given password. Checks if username is unique.
    User.register(user, req.body.user.password, function(err, user) {
      // If the current middleware func does not end the request-response cycle, it must call next() to pass control to the next middleware function.
      if(err) return next(err);
      res.json(user);
    });
  })
```


## Contributors

Feel free to refactor, update, or add new features. Have any questions, ask one of the contributors below!

| Alyssa Felix |
|:------------:|
| ![Alyssa](https://avatars0.githubusercontent.com/u/22528201?v=3&s=100)|
| ![][github-logo] [awanderlyss](https://github.com/awanderlyss) |


[github-logo]: http://cdn.shopify.com/s/files/1/0051/4802/t/72/assets/favicon.ico?1744047789295863037
[rails-ref]: http://rubyonrails.org/


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

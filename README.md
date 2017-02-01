# GamrBuddy

This app is built using [ruby on rails][rails-ref].

app is deployed @ https://gamrbuddy.herokuapp.com/

## Motivation

GamrBuddy was created so gamers have a gateway to find other gamers who play the same games as them.

## Planning

This projects planning was tracked through [Projects][projects-link].

## Development / Installation setup

The following commands are assuming you already have a rudy environment on your machine. If you dont have ruby configured you can follow this [guideline][ruby-guide] for mac.

Some dependencies used in the api and what they are being used for in the app.

<details>
  <summary>
    [will_paginate][gem-will-paginate]
  </summary>
  ```rb
    will_paginate is a pagination library.
    It was used in the project to create pages that will display a total of six games on them.
  ```
</details>
<details>
  <summary>
    [sprig][gem-sprig]
  </summary>
  <br>
  ```
  sprig is used to add seed/sample data to your Rails applications.
  It was used to simplify the the process for creating all the games and seeding the database.
  ```
</details>
<details>
  <summary>
    [devise][gem-devise]
  </summary>
  <br>
  ```
  Devise is a flexible authentication solution for Rails based on Warden.
  It was used to create a secure login for users to have access to different features.
  ```
</details>

___
OS X & Linux:

First fork and clone this repo.

```sh
# change directories
$ cd gamrbuddy
```
```sh
# install gems needed
$ bundle install
```
```sh
# start rails server
$ rails s
```
If there are no errors in the terminal, you can now navigate in our browser to <http://localhost:3000> to interact with the app.

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

[gem-devise]: https://github.com/plataformatec/devise
[gem-sprig]: https://github.com/vigetlabs/sprig
[gem-will-paginate]: https://github.com/mislav/will_paginate
[github-logo]: http://cdn.shopify.com/s/files/1/0051/4802/t/72/assets/favicon.ico?1744047789295863037
[projects-link]: https://github.com/awanderlyss/gamrbuddy/projects/1
[rails-ref]: http://rubyonrails.org/
[ruby-guide]: http://railsapps.github.io/installrubyonrails-mac.html

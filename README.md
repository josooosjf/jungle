# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

# Screenshots

## Home Page with Products

![homescreen](https://gyazo.com/1fbfca933eaba5cdae9940e785b8a89e.gif)

## Product Detail
![productdetail](https://github.com/joshbrookstone/jungle/blob/master/public/images/Screen%20Shot%202020-06-02%20at%201.59.20%20PM.png?raw=true)

## My Cart
![mycart](https://github.com/joshbrookstone/jungle/blob/master/public/images/My%20Cart.png?raw=true)

## Buying a product with Stripe
![buyproduct](https://gyazo.com/ed455779dad8e32c9b0d978f5137e745.gif)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

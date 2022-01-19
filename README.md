![rails-badge](https://img.shields.io/badge/Rails-5.2.6-informational?style=flat-square) ![ruby-badge](https://img.shields.io/badge/Ruby-2.7.2-informational?style=flat-square)

This Rails APP tracks inventories for a logistics company, created for my application to Shopify's Backend Engineering Internship program.
[Description of the Challenge](https://docs.google.com/document/d/1z9LZ_kZBUbg-O2MhZVVSqTmvDko5IJWHtuFmIu_Xg1A/edit#heading=h.n7bww7g70ipk)

#### What can I do on Food Delivery?
  - View, create, edit and delete product items
  - Add a product to a warehouse
  - View, create, and edit warehouses
  - View, create, and delete inventory
  - Update product quantity in inventory 
  - Assign products to a warehouse as long as there is stock

#### Stack
- Ruby on Rails, RSpec, PostgreSQL

# Readme Content
- [Local Setup](#local-setup)
- [Test Suite](#test-suite)
- [Database Schema](#database-schema)
- [Contributor](#contributor)

# Local Setup
- Versions
  - Rails 5.2.6
  - Ruby 2.7.2
- Installation Instructions:
  - [Ruby](https://www.ruby-lang.org/en/documentation/installation)
  - [Rails](https://guides.rubyonrails.org/v5.1/getting_started.html)
  - [PostgreSQL](https://www.postgresql.org/docs/12/tutorial-install.html)
- To check your Ruby and Rails versions, type `ruby -v` or `rails -v` in your terminal
- Fork and clone the repository
- `cd food_delivery` to get into the directory
  - To install gems:
    -  `bundle`
  - To setup database:
    - `rails db:create`
    - `rails db:migrate`
    - `rails db:seed`
- Run your own development server:
  - `rails s`
  - Your server will be running on port 3000, so navigate to http://localhost:3000 in your internet browser


# Test Suite
- Run with `bundle exec rspec`
- All tests should be passing
- 100% test coverage by SimpleCov

# Database Schema

 <img width="1043" alt="Screen Shot 2022-01-18 at 11 38 28 PM" src="https://user-images.githubusercontent.com/86392608/150077592-ee0e4c34-e710-4c27-8f39-ad0fd70217ba.png">

# Contributor
- Haewon Jeon |  [Github](https://github.com/haewonito/)  |  [LinkedIn](https://www.linkedin.com/in/leah-riffell/)

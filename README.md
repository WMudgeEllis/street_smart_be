# README

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

* hazard hash structure 
 
 ```
  {
    data: [
      {
        id: string,
        type: string,
        attributes: {
          title: string,
          description: string,
          type: string,
          longitude: string,
          latitude: string,
          user_id: integer
        }
      }
    ]
  }
 ```

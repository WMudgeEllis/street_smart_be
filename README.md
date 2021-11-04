# README

This is the back end repository for the project street smart. The front repo is [here](https://github.com/WMudgeEllis/street_smart_fe). This repository is responsible for storing and serving data to the front end which then presents the information. This follows json api format. 

The base url for the production server is 'https://street-smart-fe.herokuapp.com/'

* Ruby version

  Ruby 2.7.2

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* get api/v1/hazards

  Hazards will be filtered by proximity to current location. Exact distance tbd.

```
  {
    data: [
      {
        id: string,
        type: 'hazard',
        attributes: {
          title: string,
          description: string,
          type: string,
          longitude: string,
          latitude: string,
          category: string,
          user_id: integer,           
          created_at: datetime
          vote: {
            id: string,
            type: vote,
            attributes: {
              upvote: integer,
              downvote: integer
            }
          }
        }
      }
    ]
  }

```

* get api/v1/hazards/:id

```
  {
    data:
    {
      id: string,
      type: 'hazard',
      attributes: {
        title: string,
        description: string,
        type: string,
        longitude: string,
        latitude: string,
        category: string,
        user_id: integer,          
        created_at: datetime
        vote: {
          id: string,
          type: vote,
          attributes: {
            upvote: integer,
            downvote: integer
          }
        }
      }
    }
  }
```

* delete api/v1/hazards/:id

status 204, response:

```
  {
    data: {}
  }
```
* post api/v1/hazards

  Pass in hazard user id, title, description, latitude, and longitude as parameters. Description is optional, the others are required:

```
  {
    title: string,
    description: string,
    latitude: string,
    longitude: string,
    category: integer,
    user_id: integer
  }
```

status 201, response:

```
{
  data:
  {
    id: string,
    type: 'hazard',
    attributes: {
      title: string,
      description: string,
      type: string,
      longitude: string,
      latitude: string,
      category: string,
      user_id: integer,           
      created_at: datetime
      vote: {
        id: string,
        type: vote,
        attributes: {
          upvote: integer,
          downvote: integer
        }
      }
    }
  }
}
```

* post api/v1/users

  When creating a new user, send user id as a parameter:

```
  {
    id: string
  }
```

  status 201, response:

```
  {
    data: {
      id: string,
      type: user
    }
  }
```

* patch api/v1/votes/:id

send in param whether it was an upvote or down vote:

```
{
  id: string,
  upvote: true
}
```

or:

```
{
  id: string,
  upvote: true
}
```

response:

```
{
  id: string,
  type: vote,
  attributes: {
    id: string,
    upvotes: integer,
    downvotes: integer
  {
}
```

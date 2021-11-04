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

* get api/v1/hazards

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
      type: string,
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
    type: string,
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

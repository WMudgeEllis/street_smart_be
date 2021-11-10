# README

This is the back end repository for the project street smart. The front repo is [here](https://github.com/WMudgeEllis/street_smart_fe). This repository is responsible for storing and serving data to the front end which then presents the information. This follows json api format. 

The api c

The base url for the production server is https://street-smart-be.herokuapp.com


schema : ![Screen Shot 2021-11-04 at 11 45 33 AM](https://user-images.githubusercontent.com/84806907/140391938-a9eb5abd-db83-4c5e-a295-b6ea2c230f65.png)


* Ruby version

  Ruby 2.7.2, Rails 5.2.6

* Gems used:

  [figaro](https://github.com/laserlemon/figaro), [fast_jsonapi](https://github.com/Netflix/fast_jsonapi), [faraday](https://lostisland.github.io/faraday/), [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers), [pry](https://github.com/pry/pry), [simplecov](https://github.com/simplecov-ruby/simplecov), [factory_bot](https://github.com/thoughtbot/factory_bot), [faker](https://github.com/faker-ruby/faker), [webmock](https://github.com/bblimke/webmock), [vcr](https://github.com/vcr/vcr), [geo-kit](https://github.com/geokit/geokit-rails)

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

### API Endpoints

<details>
  <summary>Get all hazards</summary>
  * GET api/v1/hazards
  * Hazards will be filtered by proximity to current location. Exact distance tbd.
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
          user_email: string,           
          created_at: datetime
          vote_data: {
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
</details>

* get api/v1/hazards

  - Hazards will be filtered by proximity to current location. Exact distance tbd.

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
          user_email: string,           
          created_at: datetime
          vote_data: {
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

  - Returns information for only one hazard with matching ID

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
        user_email: string,          
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



```
  status 204, response:
  {
    data: {}
  }
```
* post api/v1/hazards

  - Create new hazard with request paramaters 
    - user ID
    - Title of Hazard
    - Description of Hazard (optional)
    - Latitude
    - Longitude

```
  {
    title: string,
    description: string,
    latitude: string,
    longitude: string,
    category: integer,
    user_email: string
  }
```

  - Returns status: 201 with the following response

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
      user_email: string,           
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

  - Create new user with following parameters
    - user id

```
  {
    id: string
  }
```

  - Returns status: 201 with the following response

```
  {
    data: {
      id: string,
      type: user
    }
  }
```

* put api/v1/votes/:id

  - Vote on a specific hazard with the following params
    - Vote ID
    - Upvote: 1
    or 
    - Downvote: 1

```
{
  id: string,
  upvote: integer
}
```

or:

```
{
  id: string,
  downvote: integer
}
```

* delete /api/v1/hazards/:id

  - No response, HTTP status: 204
  
* get /api/v1/walkscore

  - Get the walkscore for a specific location with required params: 
    - IP address 


```
{
    "data": {
        "id": null,
        "type": "score",
        "attributes": {
            "score": integer,
            "description": string
        }
    }
}
```

 * post /api/v1/users

  - Create new user with required params: 
    - user email: string
  
  ```
  {
    data: {
      user_email: string
    }
  }
  ```
  
  ### Contact Info 
  
  ![Linked In](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)

- [Weston Ellis](https://www.linkedin.com/in/weston-mudge-ellis/)
- [Ida Olson](https://www.linkedin.com/in/idaolson/)
- [Andrew Massey](https://www.linkedin.com/in/andrew-massey-b06662194/)
- [Ryan Teske](https://www.linkedin.com/in/ryan-teske-2021/)
- [Erin Quinn](https://www.linkedin.com/in/erin-quinn-a53a8b172/)

![Github](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)

- [Weston Ellis](https://github.com/WMudgeEllis)
- [Ida Olson](https://github.com/idaolson)
- [Andrew Massey](https://github.com/acmassey3698)
- [Ryan Teske](https://github.com/Rteske)
- [Erin Quinn](https://github.com/equinn125)

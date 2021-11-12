# Street Smart Back End Application

This is the back end repository for the project street smart. The front repo is [here](https://github.com/WMudgeEllis/street_smart_fe). This repository is responsible for storing and serving data to the front end application which handles the presentation of data. All endpoints follow JSON API spec. There is no authorization needed to access the endpoints in this repository, but some endpoints rely on data from external APIs that require authorization. More information on these endpoints and the necessary credentials can be found in the deployment instructions. 

The base url for the production server is https://street-smart-be.herokuapp.com

If you would like to visit our front-end production environment, you can acees it [here](t-smart-fe.herokuapp.com)

### Schema

![Screen Shot 2021-11-11 at 12 51 10 PM](https://user-images.githubusercontent.com/75844153/141345470-2622e476-58c8-41ff-b30e-e138c03100e3.png)

### Ruby/Rails versions

  - Ruby 2.7.2
  - Rails 5.2.6

### Gem Documentation:

  -  [figaro](https://github.com/laserlemon/figaro)
  -  [fast_jsonapi](https://github.com/Netflix/fast_jsonapi)
  -  [faraday](https://lostisland.github.io/faraday/)
  -  [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
  -  [pry](https://github.com/pry/pry)
  -  [simplecov](https://github.com/simplecov-ruby/simplecov)
  -  [factory_bot](https://github.com/thoughtbot/factory_bot)
  -  [faker](https://github.com/faker-ruby/faker)
  -  [webmock](https://github.com/bblimke/webmock)
  -  [vcr](https://github.com/vcr/vcr)'
  -  [geocoder](https://github.com/alexreisner/geocoder)
  
### Languages:
![ActiveRecord](https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white)
![Ruby](https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white)

### Deployment Tools:
![Heroku](https://img.shields.io/badge/Heroku-430098.svg?&style=flaste&logo=heroku&logoColor=white)
![Circle CI](https://img.shields.io/badge/circleci-343434?style=for-the-badge&logo=circleci&logoColor=white)
![Faraday](https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white)


### Deployment instructions

  ``` 
  git clone git@github.com:WMudgeEllis/street_smart_be.git
  
  bundle install 
  
  rake db:{create,migrate}
  
  bundle exec install figaro
  
  ```
  
  A walkscore API will need to acquired and added to the `config/application.yml` documentation for the WalkScore API can be found [here](https://www.walkscore.com/professional/api.php)
  
### How to run the test suite

  `bundle exec rspec`

### API Endpoints

<details>
  <summary>Get all hazards</summary>
  
  * Method: GET
 
  * Endpoint: api/v1/hazards
  
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


<details>
  <summary>Get one hazard</summary>
  
  * Method: GET
  
  * Endpoint: api/v1/hazards/:id

  * Returns information for only one hazard with matching ID

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
</details>

<details>
  <summary> Delete a hazard</summary>
  
  * Method: DELETE 
  
  * Endpoint: api/v1/hazards/:id
  
  * Returns status 204 with the following JSON response
  
```
  {
    data: {}
  }
```  
</details>

<details> 
  <summary>Create a New Hazard</summary>
  
  * Method: POST
  
  * Endpoint:  api/v1/hazards

  * Params for creating a new hazard
    - user ID
    - Title of Hazard
    - Description of Hazard (optional)
    - Latitude
    - Longitude
  
  * Returns 201 status with  the following JSON response
  
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
</details>

<details>
  <summary>Create a new User</summary>
  
  * Method: POST
  
  * Endpoint: api/v1/users
  
  * Params for creating a new user
    - user ID

  * Returns status 201 with the following JSON response: 

  ```
  {
    data: {
      id: string,
      type: user
    }
  }
```  
</details>


<details>
  <summary>Vote on a Hazard</summary>
  
  * Method: PUT
  
  * Endpoint: api/v1/votes/:id
  
  * Params for voting on a hazard: 
    - Hazard ID
    - Upvote: 1
    or
    - Downvote: 1
  
  * Returns status 201 with the Following JSON response: 
  
  ```
    Still need to get this
  ``` 
</details> 


<details>
  <summary>Walkscore Safety Information</summary>
  
  * Method: GET 
  
  * Endpoint: api/v1/walkscore
  
  * Params for getting a walkscore
    - IP: string
  
  Returns the following JSON response
  
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
</details>

  
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

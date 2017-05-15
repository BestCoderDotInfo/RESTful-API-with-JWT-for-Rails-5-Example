# Testing

We using Postman:

1. We need login to get `auth_token` :

https://minhquan-todo-app.herokuapp.com/login 
wiht params: 
  - email: user2@email.com
  - passwpord: 123123123
  
After login we have auth_token: 
```
{
  "auth_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE0OTQ5MzE4ODV9.3fyWCrt4qhL59CiBGWJZEuZSIUGfXey5hY2rc0VEwcU"
}
```

2. Using API to post comment:

https://minhquan-todo-app.herokuapp.com/comments

with params:

  - comment[body] : Cotent of message
 
Headers:
  - Authorization: auth_token (eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE0OTQ5MzE4ODV9.3fyWCrt4qhL59CiBGWJZEuZSIUGfXey5hY2rc0VEwcU)
  
 
If it successfully, we have: 

```
{
  "id": 8,
  "body": "Send from live API",
  "created_at": "2017-05-15T10:57:22.633Z",
  "user": {
    "id": 3,
    "email": "user2@email.com",
    "created_at": "2017-05-15T10:46:34.729Z",
    "updated_at": "2017-05-15T10:46:34.729Z"
  }
}
```

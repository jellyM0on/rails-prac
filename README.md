# API Documentation

## Post 
**MODEL** 
```
id: int 
title: string, length must be 1 to 100
content: text, length must be 1 to 1000
author_name: string, length must be 1 to 50
created_at: timestamp
updated_at: timestamp
```

**GET**
- To get all posts
    - Searchable parameters are q[title_cont] and q[author_name_cont]
    - Parameters for pagination are page and limit 
    ```
    \posts
    \posts?q[title_cont]=test
    \posts?page=2&limit=5
    ```
    - Response

    ```
    Response
    
    {
        "posts": [
            {
                "id": 6,
                "title": "test",
                "content": "test",
                "author_name": "testtest",
                "created_at": "2024-11-21T00:11:53.357Z",
                "updated_at": "2024-11-21T00:11:53.357Z"
            }
        ]
    }
    ```

- To get a post by id
    ```
    \posts\:id
    ```
    - Response
    ```
    {
        "id": 6,
        "title": "test",
        "content": "test",
        "author_name": "testtest",
        "created_at": "2024-11-21T00:11:53.357Z",
        "updated_at": "2024-11-21T00:11:53.357Z"
    }
    ```

**POST**
- To post a post by id
- Requires authorization
    ```
    \posts\:id
    ```
    - Request
    ```
    {
        "title": "test",
        "content": "test",
        "author_name": "test"
    }
    ```
    - Response
    ```
    {
        "id": 64,
        "title": "test",
        "content": "test",
        "author_name": "test",
        "created_at": "2024-11-22T03:10:13.618Z",
        "updated_at": "2024-11-22T03:10:13.618Z"
    }
    ```

**PUT**
- To put a post by id
- Requires authorization
    ```
    \posts\:id
    ```
    - Request
    ```
    {
       "title": "test",
       "content": "test"
    }
    ```
    - Response
    ```
   {
        "title": "test",
        "content": "test",
        "id": 6,
        "author_name": "testtest",
        "created_at": "2024-11-21T00:11:45.357Z",
        "updated_at": "2024-11-21T00:11:53.357Z"
    }
    ```

**DELETE**
- To delete a post by id
- Requires authorization
    ```
    \posts\:id
    ```
    - Response
    ```
    {
        "id": 64,
        "title": "test",
        "content": "test",
        "author_name": "test",
        "created_at": "2024-11-22T03:10:13.618Z",
        "updated_at": "2024-11-22T03:10:13.618Z"
    }
    ```

## Comment
**MODEL** 
```
id: int 
post_id: int
comment_name: text, length must be 1 to 50
content: string, length must be 1 to 1000
created_at: timestamp
updated_at: timestamp
```
**GET**
- Get all comments for a post by post_id
    ```
    /posts/:post_id/comments
    ```
    - Response 
    ```
    [
        {
            "id": 7,
            "post_id": 29,
            "commenter_name": "test",
            "content": "test ",
            "created_at": "2024-11-21T00:14:21.206Z",
            "updated_at": "2024-11-21T00:14:21.206Z"
        }
    ]
    ```
**POST**
- Post a comment for a post by post_id
- Requires authorization
    ```
    /posts/:post_id/comments
    ```
    - Request
    ```
    {
        "post_id": 58,
        "commenter_name":"test",
        "content": "test"
    }
    ```
    - Response
    ```
    {
        "id": 25,
        "post_id": 58,
        "commenter_name": "test",
        "content": "test",
        "created_at": "2024-11-22T01:38:41.948Z",
        "updated_at": "2024-11-22T01:38:41.948Z"
    }
    ```

**DELETE**
- Delete a comment for a post by id and post_id
- Requires authorization
    ```
    /posts/:post_id/commments/:id
    ```
    - Response
    ```
    {
        "id": 7,
        "post_id": 29,
        "commenter_name": "test",
        "content": "test",
        "created_at": "2024-11-21T00:14:21.206Z",
        "updated_at": "2024-11-21T00:14:21.206Z"
    }
    ```
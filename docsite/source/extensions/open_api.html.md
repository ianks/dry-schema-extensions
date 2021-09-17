---
title: Open API
layout: gem-single
name: dry-schema
---

The `:open_api` extension allows you to generate a valid [Open API definition](https://swagger.io/docs/specification/about/) from a `Dry::Schema`. OpenAPI is a widely used standard, so this unlocks many possibilities.

```ruby
Dry::Schema.load_extensions(:json_schema)

UserSchema = Dry::Schema.JSON do
  required(:email).filled(:str?, min_size?: 8)
  optional(:favorite_color).filled(:str?, included_in?: %w[red green blue pink])
  optional(:age).filled(:int?)
end

UserSchema.open_api 
# {
#   "type": "object",
#   "properties": {
#     "email": {
#       "type": "string",
#       "minLength": 8
#     },
#     "favorite_color": {
#       "type": "string",
# .     "enum": ["red", "green", "blue", "pink"]
#     },
#     "age": {
#       "type": "integer"
#     },
#   },
#   "required": ["email"] 
# }
```

### Learn more

- [Official OpenAPI docs](https://www.openapis.org/)


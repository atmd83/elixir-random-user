## Elixir Random User
> An Elixir library to generate fake/mock/random user profiles.


Elixir Random User (ERU) generates random (and not so random) user profile data including names, addresses, password details, 
profile photos and more. These details can then be used on website mock ups, used for automated testing, seed a staging 
database or indeed anything else where fake/mock user data is needed but writing it from scratch is a pain.

ERU uses the [randomuser.me](https://randomuser.me/) api to generate it's data, then formats this into an Elixit Struct.

> All credit for generating the original data to randomuser.me, ERU is a wrapper for that service.

### Installation
TODO

### Usage
```elixir
RandomUser.generate_user()
```
**Returns a list of `%RandomUser.User{}`, for example:**
```elixir
[
  %RandomUser.User{
    cell:       "[mobile number: string]", 
    dob:        "[date and timestamp: string]",
    email:      "[email address: string]", 
    gender:     "[gender: string]",
    nat:        "[country code: string]",
    phone:      "[phone number: string]",
    registered: "[date and timestamp: string]",
    picture:    %{},
    id:         %{},
    location:   %{},
    login:      %{},
    name:       %{} 
  }
]

```

The `picture`, `id`, `login`, `location` and `name` fields contain object:


**TODO** describe above objects


### Customise the generated data
As per the original randomuser.me api you can configure the generated data, the option available are:


**TODO** Full options


**for example, to request 5, female users from Great Britain:**
```elixir
RandomUser.generate_user(%{"results" => 5, "gender" => "female", "nat" => "GB"})
```


**TODO** More examples


**TODO** explain `exc` option and the `nil` values


###### TODO 
- push to Hex
- ExDocs
- push docs to hexdocs


<!--
```elixir
def deps do
  [{:random_user, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/random_user](https://hexdocs.pm/random_user).

-->
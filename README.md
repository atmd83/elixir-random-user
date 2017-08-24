## Elixir Random User
> An Elixir library to generate fake/mock/random user profiles.


Elixir Random User (ERU) generates random (and not so random) user profile data including names, addresses, password details, 
profile photos and more. These details can then be used on website mock ups, used for automated testing, seed a staging 
database or indeed anything else where fake/mock user data is needed but writing it from scratch is a pain.

ERU uses the [randomuser.me](https://randomuser.me/) api to generate it's data, then formats this into an Elixit Struct.

> All credit for generating the original data to randomuser.me, ERU is a wrapper for that service.

### Installation
In your mix.exs file add ERU as a dep:
```elixir
def deps do
  {:random_user, github: "atmd83/elixir-random-user"}
end
```
then run
`mix deps.get`

you can then `import` or `alias` the module and use in your code.

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


#### picture
```elixir
%{
  "large" => "https://randomuser.me/api/portraits/men/60.jpg",
  "medium" => "https://randomuser.me/api/portraits/med/men/60.jpg",
  "thumbnail" => "https://randomuser.me/api/portraits/thumb/men/60.jpg"
}
```

#### id
```elixir
%{
  "name" => "NINO", 
  "value" => "CG 79 90 99 E"
}
```

#### login
```elixir
%{
  "md5" => "4250705db9a4bd5e33b41f63fb13f426",
  "password" => "asdf1234", "salt" => "CWJg8Rdn",
  "sha1" => "83a76640379a432861ef02c7247b6b12097cac39",
  "sha256" => "d1e87b120306655798f941bf52936b4b722bd489fac95c3d53fac4ef8b47989c",
  "username" => "orangemouse559"
}
```

#### location
```elixir
%{
  "city" => "canterbury", 
  "postcode" => "C8J 8YL",
  "state" => "merseyside", 
  "street" => "5823 park avenue"
}
```

#### name
```elixir
%{
  "first" => "karl", 
  "last" => "caldwell", 
  "title" => "mr"
}
```


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
defmodule RandomUser do
  alias RandomUser.User

  @defaults %{
    "results" => "1",
    "gender" => "",
    "seed" => "",
    "nat" => "gb",
    "exc" => ""
  }

  def struct_from_map(a_map, as: a_struct) do
    # Find the keys within the map
    keys = Map.keys(a_struct) |> Enum.filter(fn x -> x != :__struct__ end)
    # Process map, checking for both string / atom keys
    processed_map =
      for key <- keys, into: %{} do
          value = Map.get(a_map, key) || Map.get(a_map, to_string(key))
          {key, value}
      end

    a_struct = Map.merge(a_struct, processed_map)
    a_struct
  end

  defp generate_url(config) do
    "https://randomuser.me/api/?#{URI.encode_query(config)}&noinfo"
  end

  def generate_user(config \\ %{}) do
    config = Map.merge(@defaults, config)

    {:ok, user} = HTTPoison.get generate_url(config)
    {:ok, response} = Poison.decode(user.body)

    response["results"] |> Enum.map(fn r ->
      struct_from_map(r, as: %User{})
    end)
  end
end

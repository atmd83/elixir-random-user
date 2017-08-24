defmodule RandomUserTest do
  use ExUnit.Case
  doctest RandomUser

  test "generate_user return a single user's data" do

    user = RandomUser.generate_user()

    assert Enum.count(user) == 1

    user |> Enum.map(fn u ->
     assert u.cell != ""
     assert u.dob != ""
     assert u.gender != ""
     assert u.nat != ""
    end)
  end

  test "generates only female random users if the gender param is passed" do
    user = RandomUser.generate_user(%{"gender" => "female"})

    assert Enum.count(user) == 1

    user |> Enum.map(fn u ->
      assert u.gender == "female"
    end)
  end


  test "generates only male random users if the gender param is passed" do
    user = RandomUser.generate_user(%{"gender" => "male"})

    assert Enum.count(user) == 1

    user |> Enum.map(fn u ->
      assert u.gender == "male"
    end)
  end

  test "generates the same data if a seed is set" do
     user = RandomUser.generate_user(%{"seed" => "testing"})

     List.first(user) |> (fn u ->
        assert u.name["first"] == "johnny"
     end).()
  end

  test "generates more random users if a results number is set" do
     user = RandomUser.generate_user(%{"results" => 5})
     assert Enum.count(user) == 5
  end

  test "generates nil values if the exc field is set" do
    user = RandomUser.generate_user(%{"exc" => "email, dob"})
    user |> Enum.map(fn u ->
      assert u.email == nil
      assert u.dob == nil
    end)
  end
end

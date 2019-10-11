alias TaeyAPI.Repo
alias TaeyAPI.Auth.Role

Repo.insert! %Role{
  name: "Admin",
  description: "Admin can do everything."
}

Repo.insert! %Role{
  name: "Manager",
  description: "Manager can do something."
}

Repo.insert! %Role{
  name: "User",
  description: "User can do nothing."
}

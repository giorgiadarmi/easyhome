Canard::Abilities.for(:admin) do
  can [:create,:update,:destroy], Ad
  can [:create,:update, destroy], Articles
  can [:create,:destroy], Comment

end

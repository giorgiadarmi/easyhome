Canard::Abilities.for(:admin) do
  can [:create,:update,:destroy], Ad
  can [:create,:update, :destroy], Article
  can [:create,:destroy], Comment

end

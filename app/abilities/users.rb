Canard::Abilities.for(:user) do
  can [:create,:update,:destroy], Ad
  can [:create,:update], Article
  can [:create,:destroy], Comment
end

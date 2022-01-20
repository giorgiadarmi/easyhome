Canard::Abilities.for(:user) do
  can [:create,:update,:destroy], Ad
  can [:create,:update], Articles
  can [:create,:destroy], Comment
end

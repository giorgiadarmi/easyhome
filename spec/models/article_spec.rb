require 'rails_helper'

RSpec.describe Article, type: :model do

  it "Create a article" do
    user = User.create(:email => "user@test.it", :password => "12345678")
    article = Article.create(:title => "Bonus 110%", :user_id => "#{user.id}")
    expect(article).to be_valid
  end

  it "Create a article witout title" do
      user = User.create(:email => "user@test.it", :password => "12345678")
      article = Article.create(:user_id => "#{user.id}")
      expect(article).not_to be_valid
  end

end

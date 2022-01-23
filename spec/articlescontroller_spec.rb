require 'rails_helper'
require "./app/models/article.rb"

describe Article do
	before(:all) do
		Article.all.each do  |at|
			at.destroy
		end
	end
	after(:all) do
		Article.all.each do  |at|
			at.destroy
		end
	end
	
	context "No Likes Are In Place" do

		before(:all) do
			 @article = Article.new(title: "Test", text: "prova", author: "Autore")
		end
		it "has average score equal 0" do
			@article.likes.count.eql? 0
		end
	end

	#Registered Users
	context "with Registered User privileges" do
		before :each do
			user = users(:registered)
			sign_in user
		end

		#Create
		it "should create article" do
			params = {:article=>{:title => "Title"}}
			get :create, :params => params
			r_tst = Article.where(:title => "Title")
			expect(r_tst).not_to be_empty
		end
	end

end


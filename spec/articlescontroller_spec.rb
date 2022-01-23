require 'rails_helper'
require "./app/models/article.rb"
require "./app/models/user.rb"


describe Article do
	fixtures :all

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

	#Banned
	context "with Banned privileges" do
		before :each do
			banned = users(:banned)
			sign_in banned
		end

		#Create
		it "should not create article" do
			params = {:article=>{:title => "Title", :text => "Text", :author => "Autore"}}
			get :create, :params => params
			a_tst = Article.where(:title => "Title")
			expect(a_tst).to be_empty
		end
	end

end


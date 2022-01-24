require 'rails_helper'
require "./app/models/article.rb"
require "./app/models/user.rb"


describe ArticlesController, type: :controller do
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
		it "should not create articles" do
			params = {:article=>{:title => "Bonus 110%"}}
			get :create, :params => params
			m_tst = Article.where(:title => "Bonus 110%")
			expect(m_tst).not_to be_empty
		end
		
		#Retrieve
		it "should retrieve articles" do
			a = articles(:one)
			params = {:id => a.id}
			get :show, :params => params
			expect(assigns(:article)).to eql(a)
		end
		
		
        #Update
		it "should not update articles" do
			a = articles(:one)
			params = {:id => a.id, :article=>{:title => "Bonus 110%"}}
			get :update, :params => params
			a_tst = Article.find(a.id)
			expect(a_tst.title).to eql(a.title)
		end

        #Destroy
		it "should not destroy articles" do
			a = articles(:one)
			params = {:id => a.id}
			get :destroy, :params => params
			a_tst = Article.where(:id => a.id)
			expect(a_tst).to be_empty
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
			params = {:article=>{:title => "Bonus 110%"}}
			get :create, :params => params
			a_tst = Article.where(:title => "Bonus 110%")
			expect(a_tst).not_to be_empty
		end

		#Retrieve
		it "should retrieve articles" do
			a = articles(:one)
			params = {:id => a.id}
			get :show, :params => params
			expect(assigns(:article)).to eql(a)
		end

        #Update
		it "should cannot update all articles" do
			a = articles(:one)
			params = {:id => a.id, :article=>{:title => "Bonus 110%"}}
			get :update, :params => params
			m_tst = Article.find(a.id)
			expect(m_tst.title).to eql(a.title)
		end

		#Destroy
		it "should not destroy articles" do
			a = articles(:one)
			params = {:id => a.id}
			get :destroy, :params => params
			m_tst = Article.where(:id => a.id)
			expect(m_tst).to be_empty
		end
	end

    #Admins
	context "with Admin privileges" do
		before :each do
			admin = users(:admin)
			sign_in admin
		end

		#Create
		it "should create articles" do
			params = {:article=>{:title => "Bonus 110%"}}
			get :create, :params => params
			a_tst = Article.where(:title => "Bonus 110%")
			expect(a_tst).not_to be_empty
		end
		
        #Retrieve
		it "should retrieve articles" do
			a = articles(:one)
			params = {:id => a.id}
			get :show, :params => params
			expect(assigns(:article)).to eql(a)
		end

		#Update
		it "should not update articles" do
			a = articles(:one)
			params = {:id => a.id, :article=>{:title => "Bonus 110%"}}
			get :update, :params => params
			m_tst = Article.find(a.id)
			expect(m_tst.title).to eql(a.title)
		end

		#Delete
		it "should destroy articles" do
			a = articles(:one)
			params = {:id => a.id}
			get :destroy, :params => params
			m_tst = Article.where(:id => a.id)
			expect(m_tst).to be_empty
		end
	end

end


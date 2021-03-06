require "rails_helper"

RSpec.feature "Listing Articles" do
	 	
	before do
		@article1 =Article.create(title: "first title",body: "article bisy")
		@article2 =Article.create(title: "second title",body: "article body")
		@article3 =Article.create(title: "first title",body: "article box")
	end

	scenario "Listing Articles" do
		visit "/"
		expect(page).to have_content(@article1.title)
		expect(page).to have_content(@article1.body)
		expect(page).to have_content(@article2.title)
		expect(page).to have_content(@article2.body)
		expect(page).to have_content(@article3.title)
		expect(page).to have_content(@article3.body)
		expect(page).to have_link(@article1.title)
		expect(page).to have_link(@article2.title)
		expect(page).to have_link(@article3.title)
	end

end
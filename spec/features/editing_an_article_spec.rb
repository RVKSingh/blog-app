require "rails_helper"

RSpec.feature "Editinf an Article" do
	
	before do
		@article = Article.create(title:"first Article",body:"first articlle body")
	end

	scenario "A user update an articles" do
		visit "/"

		click_link @article.title
		click_link "Edit Article"

		fill_in "Title", with:"updated first article"
		fill_in "Body", with: "updated first article body"

		click_button "update Article"

		expect(page).to have_content("Article has been Updated")
		expect(page.current_path).to eq(article_path(@article))
	end

	scenario "A user fail to update an articles" do
		visit "/"

		click_link @article.title
		click_link "Edit Article"

		fill_in "Title", with:""
		fill_in "Body", with: "updated first article body"

		click_button "update Article"

		expect(page).to have_content("Article has not been Updated")
		expect(page.current_path).to eq(article_path(@article))
	end
end
require "rails_helper"

RSpec.feature "Deleting an article" do
	
	before do
		@article = Article.create(title:"first Article",body:"first articlle body")
	end

	scenario "A user delete an article" do
		visit "/"

		click_link @article.title
		click_link "Delete Article"

		expect(page).to have_content("Article has been deleted")
		expect(page.current_path).to eq(articles_path)
	end
end
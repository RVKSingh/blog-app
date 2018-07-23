require "rails_helper"

RSpec.feature "show Articles" do
	
	before do
		@article = Article.create(title: "Article title",body: "Article body")
	end

	scenario "Display individual Article" do
		visit "/"

		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))
	end

end
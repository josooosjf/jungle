require 'rails_helper'

RSpec.feature "product details", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products and succesffuly click on the first" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    # save_screenshot
    expect(page).to have_css 'article.product', count: 10

    page.first('article.product header h4').click
    
    expect(page).to have_css 'article.product-detail'
    save_screenshot

  end


end

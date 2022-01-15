require 'rails_helper'

RSpec.describe "Bulk Discounts Index page" do
  it 'displays discount info' do
    merch_1 = Merchant.create!(name: "Shop Here")
    merch_2 = Merchant.create!(name: "Buy Here")

    discount_a = merch_1.bulk_discounts.create({name:"Discount A", discount: 0.20, threshold: 10 })
    discount_b = merch_1.bulk_discounts.create({name:"Discount B", discount: 0.30, threshold: 15 })
    discount_c = merch_2.bulk_discounts.create({name:"Discount C", discount: 0.25, threshold: 20 })

    visit "/merchants/#{merch_1.id}/bulk_discounts/"

    expect(page).to have_content(discount_a.name)
    expect(page).to have_content(discount_b.name)
    expect(page).to_not have_content(discount_c.name)
    expect(page).to have_content(discount_a.discount)
    expect(page).to have_content(discount_b.discount)
    expect(page).to_not have_content(discount_c.discount)
    expect(page).to have_content(discount_a.threshold)
    expect(page).to have_content(discount_b.threshold)
    expect(page).to_not have_content(discount_c.threshold)

    save_and_open_page
  end
#   Where I see all of my bulk discounts including their
# percentage discount and quantity thresholds
# And each bulk discount listed includes a link to its show page
end

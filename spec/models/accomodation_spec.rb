require "rails_helper"

RSpec.describe Accomodation, type: :model do
  it "Should persist an Accomodation" do
    a = Accomodation.create(available_beds: 3,
                            price: 68,
                            description: "Tres jolie maison",
                            has_wifi: true,
                            welcome_message: "Welcome home !",
                            adm_id: User.ids.sample,
                            city_id: City.ids.sample)
    expect(a.available_beds).to eq(3)
    expect(a.price).to eq(68)
    expect(a.description).to eq("Tres jolie maison")
    expect(a.has_wifi).to eq(true)
    expect(a.welcome_message).to eq("Welcome home !")
  end
end

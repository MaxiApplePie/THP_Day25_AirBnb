require "rails_helper"

RSpec.describe City, type: :model do
  it "Should persist a City" do
    c = City.create(name: "Paris",
                    zip_code: "75001")
    expect(c.name).to eq("Paris")
    expect(c.zip_code).to eq("75001")
  end

  it "City should be able to list accomodations" do
    c = City.create(name: "Paris",
                    zip_code: "75001")
    a = Accomodation.create(available_beds: 3,
                            price: 68,
                            description: "Tres jolie maison",
                            has_wifi: true,
                            welcome_message: "Welcome home !",
                            adm_id: User.all.sample,
                            city_id: c.id)
    expect(c.accomodations).not_to be_nil
    # tp City.find(807).accomodations
    # expect(c.Accomodation.first.class).to be_a_kind_of(Accomodation)
  end
end

require "rails_helper"

RSpec.describe Reservation, type: :model do
  it "Should persist an Reservation" do
    r = Reservation.create(start_date: "2021-07-08",
                           end_date: "2021-07-29",
                           accomodation_id: Accomodation.ids.sample,
                           user_id: User.ids.sample)
    expect(r.start_date).to eq("2021-07-08")
    expect(r.end_date).to eq("2021-07-29")
  end
end

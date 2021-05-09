require "rails_helper"

RSpec.describe User, type: :model do
  it "should persist a User" do
    # Il faut verifer qu'on peut bien creer un user !
    u = User.create(email: "lmc@outlook.fr", phone_number: "+33 6 25 15 24 14", description: "Myself")

    expect(u.email).to eq("lmc@outlook.fr")
    expect(u.phone_number).to eq("+33 6 25 15 24 14")
    expect(u.description).to eq("Myself")
    # Puts "User #{u.description} is created with phone #{u.phone_number} and email #{u.email}"
  end

  it "should be able to address accomodations as a Host" do
    u = User.create(email: "lmc@outlook.fr", phone_number: "+33 6 25 15 24 14", description: "Myself")
    a = Accomodation.create(available_beds: 3, price: 68, description: "Tres jolie maison", has_wifi: true, welcome_message: "Welcome home !", adm_id: u.id, city_id: City.ids.sample)
    # Accomodation bien créée sur la base du User ?
    expect(u.accomodations).not_to be_nil
    # Les Ids user correspondent ?
    expect(u.id).to eq(a.adm_id)
    # Le type Accomodation est bon ?
    # expect(Accomodation.last.user.accomodations.last).to be_a(Accomodation)
  end

  it "should be able to address reservations" do
    u = User.create(email: "lmc@outlook.fr", phone_number: "+33 6 25 15 24 14", description: "Myself")
    a = Accomodation.create(available_beds: 3, price: 68, description: "Tres jolie maison", has_wifi: true, welcome_message: "Welcome home !", adm_id: User.ids.sample, city_id: City.ids.sample)
    r = Reservation.create(start_date: "2021-05-08", end_date: "2021-05-17", accomodation_id: a.id, user_id: u.id)
    # Reservation bien créée avec le User ?
    expect(u.reservations).not_to be_nil
    # Les Ids user correspondent ?
    expect(u.id).to eq(r.user_id)
    # N'oublions pas qu'un autre User gere l'accomodation

  end
end

FactoryBot.define do
  factory :valid_user, class: User do
    gamer_name Faker::OnePiece.character
    email { Faker::Internet.email }
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    password "123#{Faker::Lorem.word}abc!"
  end

  factory :invalid_user, class: User do
    gamer_name nil
    email nil
    first_name nil
    last_name nil
    password nil
  end
end

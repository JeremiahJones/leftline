FactoryBot.define do
  factory :valid_config, class: GameConfiguration do
    game Faker::OnePiece.island
    settings {{"forward": "w",
              "backwards": "s",
              "left": "a",
              "right": "d"}}
    association :user, factory: :valid_user
  end

  factory :invalid_config, class: GameConfiguration do
    game nil
    settings {{}}
    association :user, factory: :valid_user
  end
end
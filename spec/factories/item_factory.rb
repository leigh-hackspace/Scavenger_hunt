FactoryBot.define do
  factory :item do
    title { "Normal Item" }
    body  { "This is a clue" }

    after(:build) do |bonus_item|
      bonus_item.image.attach(
        io: File.open(Rails.root.join('spec', 'fixture_files', 'image.jpg')),
        filename: 'test.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end

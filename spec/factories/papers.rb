FactoryBot.define do
  factory :paper do
    title { "AI writes better AI than Humans" }
    venue { "AI Town" }
    year { 2019 }
    authors {build_list :author, 1}
  end
end

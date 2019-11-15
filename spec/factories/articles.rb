FactoryBot.define do
  factory :article do
    title { "Nouvelle du jour" }
    summary { "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. " }
    date { "2019-11-15" }
    status { false }
    link { "https://monflux.com/nouvelle-du-jour" }
    feed { nil }
  end
end

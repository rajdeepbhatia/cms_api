FactoryBot.define do
  factory :content do
    title { 'Cool Content!' }
    published_date { '2019-01-27 21:42:13' }
    author { 'Rajdeep' }
    summary { 'This is an awesome article!' }
    content { 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.' }
    status { 1 }
  end

end
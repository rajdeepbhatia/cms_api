10.times do |i|
  Content.create!(title: "Awesome Title #{i}!", published_date: Time.now, author: 'Rajdeep',
                 summary: "This is an awesome article #{i}!",
                 content: "This is an awesome article #{i} must read content! Just read it once")
end
10.times do |i|
  Content.create!(title: "Awesome Title #{i}!", published_date: Time.now, author: 'Rajdeep',
                 summary: "This is an awesome article #{i}!",
                 content: "This is an awesome article #{i} must read content! Just read it once", status: :published)
end

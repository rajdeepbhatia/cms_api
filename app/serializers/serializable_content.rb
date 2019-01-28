class SerializableContent < JSONAPI::Serializable::Resource
  type 'content'

  attributes :title, :published_date, :author, :summary, :content
end

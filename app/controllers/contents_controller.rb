class ContentsController < ApplicationController

  def index
    # TODO: Add caching mechanism
    page = params[:page].to_i
    offset = page <= 1 ? 0 : ((page - 1) * Content::DEFAULT_LIMIT)
    contents = Content.published.offset(offset).limit(Content::DEFAULT_LIMIT)
    render jsonapi: contents, status: 200
  end
end

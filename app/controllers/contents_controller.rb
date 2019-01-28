class ContentsController < ApplicationController

  def index
    contents = Content.published
    render jsonapi: contents, status: 200
  end
end

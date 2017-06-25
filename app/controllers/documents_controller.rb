require 'yomu'

class DocumentsController < ApplicationController
  def create
    file_param = document_params[:file]
    decoded_file = Base64.decode64(file_param)
    decoded_io = StringIO.new(decoded_file)

    parsed_document = Yomu.new(decoded_io)
    metadata = parsed_document.metadata

    result = {
      title: metadata['title'],
      content_type: metadata['Content-Type'],
      created_at: metadata['meta:creation-date'],
      metadata: metadata,
      text: parsed_document.text
    }

    render json: result
  end

  private

  def document_params
    params.permit(:file)
  end
end

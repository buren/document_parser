require 'yomu'

class DocumentsController < ApplicationController
  def create
    file_param = document_params[:file]
    begin
      decoded_file = Base64.strict_decode64(file_param)
    rescue ArgumentError
      render json: { status: 400, message: 'Invalid Base64 string' }
      return
    end

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

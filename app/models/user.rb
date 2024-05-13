class User
  include Mongoid::Document
  include Mongoid::Timestamps

#   include PdfDocumentUploader::Attachment.new(:pdf_document)

  field :name, type: String
  field :email, type: String
  field :pdf_document, type: BSON::Binary
end

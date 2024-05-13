class PdfDocumentUploader < Shrine
  plugin :determine_mime_type
  plugin :remove_attachment
  plugin :validation_helpers

  Attacher.validate do
    validate_mime_type %w[application/pdf]
  end
end

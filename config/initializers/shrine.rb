# require 'mongo'
# require 'shrine'
# require 'shrine/storage/gridfs'
# require 'shrine/plugins/mongoid'

# client = Mongo::Client.new(['mongodb:27017'], database: 'myapp_development')
# # client = Mongo::Client.new("mongodb://localhost:27017/myapp_development")
# # Shrine::Storage::Gridfs.new(client:)

# options = {
#     database: 'myapp_development',
#     bucket: 'fs'
# }

# Shrine.storages = {
#   cache: Shrine::Storage::Gridfs.new(client:, prefix: 'temp', **options),
#   store: Shrine::Storage::Gridfs.new(client:, prefix: 'fs', **options)
# }

# Shrine.plugin :mongoid
# Shrine.plugin :cached_attachment_data
# # Shrine.plugin :gridfs

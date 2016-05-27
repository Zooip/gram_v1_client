#/lib/GramAccount.rb
#!/bin/env ruby
# encoding: utf-8


# exemple de recherche par email
# GramEmail.find("monEmail@gadz.org")

require 'active_resource'
class GramV1Client::Email < GramV1Client::Base
  self.element_name = "emails"
  self.collection_name = "emails"
  self.format = GramV1Client::JsonFormatter.new(self.collection_name)


  #Overwrite find_single from ActiveResource::Base to be able to use gram api (/accounts suffix)
  #https://github.com/rails/activeresource/blob/master/lib/active_resource/base.rb#L991
  def self.element_path(id, prefix_options = {}, query_options = nil)
     id += "/accounts"
     super(id, prefix_options, query_options)
  end

  def collection_path(prefix_options = {}, query_options = nil)
    id += "/accounts"
    super(id, prefix_options, query_options)
  end

  #Overwrite to_param from ActiveResource::Base to be able to use gram api (id = hruid)
  #https://github.com/rails/activeresource/blob/master/lib/active_resource/base.rb#L991
  def to_param
    self.hruid
  end

end
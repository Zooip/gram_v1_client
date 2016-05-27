#/lib/GramAccount.rb
#!/bin/env ruby
# encoding: utf-8


require 'active_resource'
class GramV1Client::Base < ActiveResource::Base

  # This is set to enable Configuration change at runtime.

   class << self
    def site
      if GramV1Client.configuration.site
        if super.to_s != URI.parse(GramV1Client.configuration.site).to_s
          reload_config
        end
      end
      super
    end

    def user()
      if GramV1Client.configuration.user
        if super.to_s != GramV1Client.configuration.user
          reload_config
        end
      end
      super
    end

    def password() 
      if GramV1Client.configuration.password
        if super.to_s != GramV1Client.configuration.password
          reload_config
        end
      end
      super
    end

    def proxy() 
      if GramV1Client.configuration.proxy
        if super.to_s != URI.parse(GramV1Client.configuration.proxy).to_s
          reload_config
        end
      end
      super
    end


    def reload_config
      self.site= GramV1Client.configuration.site
      self.user= GramV1Client.configuration.user 
      self.password=GramV1Client.configuration.password 
      self.proxy=GramV1Client.configuration.proxy
    end
  end

end
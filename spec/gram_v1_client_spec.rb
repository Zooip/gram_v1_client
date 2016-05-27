require 'spec_helper'
require 'uri'

describe GramV1Client do
  it 'has a version number' do
    expect(GramV1Client::VERSION).not_to be nil
  end


  describe "configuration" do
    it 'is configurable' do
      GramV1Client.configure do |c|
        c.site="my_site"
        c.password="my_password"
        c.user="my_user"
        c.proxy="my_proxy"
      end

      expect(GramV1Client.configuration.site).to eq("my_site")
      expect(GramV1Client.configuration.user).to eq("my_user")
      expect(GramV1Client.configuration.password).to eq("my_password")
      expect(GramV1Client.configuration.proxy).to eq("my_proxy")
    end

    it "update Base configuration" do
      GramV1Client.configure do |c|
        c.site="my_site"
        c.password="my_password"
        c.user="my_user"
        c.proxy="my_proxy"
      end

      expect(GramV1Client::Base.site).to eq(URI.parse("my_site"))
      expect(GramV1Client::Base.user).to eq("my_user")
      expect(GramV1Client::Base.password).to eq("my_password")
      expect(GramV1Client::Base.proxy).to eq(URI.parse("my_proxy"))
    end
  end
end


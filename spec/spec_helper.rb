require "bundler/setup"
Bundler.require :default, :development

require "lomadee"
require "fakeweb"

def load_fixture(filename)
  File.open("spec/fixtures/#{filename}.json").read
end

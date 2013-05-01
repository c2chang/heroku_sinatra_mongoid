require 'mongoid'

class Coder
  include Mongoid::Document
  field :name 
  field :age
  field :languages
end

require 'hashie/mash'

module Revolut
  # Custom Mash class with disabled warnings.
  class Mash < Hashie::Mash
    disable_warnings
  end
end

require "hashie"

module Fletcher
  module Item
    class Base < ::Hashie::Mash         
      # Create a product object based on service
      #   Fletcher::Item::Base.generate(:amazon, "<html>...") # => #<Fletcher::Item::Amazon:0x...> 
      def self.generate(service = nil, data = nil)
        case service
        when :amazon
          item = Fletcher::Item::Amazon.new
        when :ebay
          item = Fletcher::Item::Ebay.new
        end
        
        item.parse(data)
        return item 
      end

      # Parse data and set object attributes    
      def parse(data)
        self.doc = data # save data for if user wants to access it later      
      end      
    end # Base
  end # Product
end # Fletcher
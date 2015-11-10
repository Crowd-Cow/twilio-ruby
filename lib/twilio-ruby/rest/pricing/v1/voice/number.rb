##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class NumberList < ListResource
      ##
      # Initialize the NumberList
      def initialize(version)
        super(version)
        
        # Path Solution
        @solution = {}
      end
      
      ##
      # Constructs a NumberContext
      def get(number)
        NumberContext.new(@version, number, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Pricing.V1.NumberList>'
      end
    end
  
    class NumberContext < InstanceContext
      def initialize(version, number)
        super(version)
        
        # Path Solution
        @solution = {
            'number' => number,
        }
        @uri = "/Voice/Numbers/#{@solution[:number]}"
      end
      
      ##
      # Fetch a NumberInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return NumberInstance.new(
            @version,
            payload,
            number: @solution['number'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Pricing.V1.NumberContext #{context}>"
      end
    end
  
    class NumberInstance < InstanceResource
      def initialize(version, payload, number: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'number' => payload['number'],
            'country' => payload['country'],
            'iso_country' => payload['iso_country'],
            'outbound_call_price' => payload['outbound_call_price'],
            'inbound_call_price' => payload['inbound_call_price'],
            'price_unit' => payload['price_unit'],
            'url' => payload['url'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'number' => number || @properties['number'],
        }
      end
      
      def _context
        unless @instance_context
          @instance_context = NumberContext(
              @version,
              @params['number'],
          )
        end
        @instance_context
      end
      
      def number
        @properties['number']
      end
      
      def country
        @properties['country']
      end
      
      def iso_country
        @properties['iso_country']
      end
      
      def outbound_call_price
        @properties['outbound_call_price']
      end
      
      def inbound_call_price
        @properties['inbound_call_price']
      end
      
      def price_unit
        @properties['price_unit']
      end
      
      def url
        @properties['url']
      end
      
      ##
      # Fetch a NumberInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Pricing.V1.NumberInstance #{context}>"
      end
    end
  end
end
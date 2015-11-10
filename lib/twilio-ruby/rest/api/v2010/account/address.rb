##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class AddressList < ListResource
      ##
      # Initialize the AddressList
      def initialize(version, account_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/Addresses.json"
      end
      
      ##
      # Create a new AddressInstance
      def create(customer_name, street, city, region, postal_code, iso_country, friendly_name: nil)
        data = {
            'CustomerName' => customer_name,
            'Street' => street,
            'City' => city,
            'Region' => region,
            'PostalCode' => postal_code,
            'IsoCountry' => iso_country,
            'FriendlyName' => friendly_name,
        }
        
        payload = @version.create(
            'POST',
            @uri,
            data
        )
        
        return AddressInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
        )
      end
      
      ##
      # Reads AddressInstance records from the API as a list.
      def read(customer_name: nil, friendly_name: nil, iso_country: nil, limit: nil, page_size: nil)
        @version.read(
            friendly_name: nil,
            iso_country: nil,
            limit: nil,
            page_size: nil
        )
      end
      
      ##
      # Retrieve a single page of AddressInstance records from the API.
      def page(customer_name: nil, friendly_name: nil, iso_country: nil, page_token: nil, page_number: nil, page_size: nil)
        params = {
            'CustomerName' => customer_name,
            'FriendlyName' => friendly_name,
            'IsoCountry' => iso_country,
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        response = @version.page(
            'GET',
            @uri,
            params
        )
        return AddressPage.new(
            @version,
            response,
            account_sid: @solution['account_sid'],
        )
      end
      
      ##
      # Constructs a AddressContext
      def get(sid)
        AddressContext.new(@version, sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.AddressList>'
      end
    end
  
    class AddressContext < InstanceContext
      def initialize(version, account_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid,
            'sid' => sid,
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/Addresses/#{@solution[:sid]}.json"
        
        # Dependents
        @dependent_phone_numbers = nil
      end
      
      ##
      # Deletes the AddressInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      ##
      # Fetch a AddressInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return AddressInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Update the AddressInstance
      def update(friendly_name: nil, customer_name: nil, street: nil, city: nil, region: nil, postal_code: nil)
        data = {
            'FriendlyName' => friendly_name,
            'CustomerName' => customer_name,
            'Street' => street,
            'City' => city,
            'Region' => region,
            'PostalCode' => postal_code,
        }
        
        payload = @version.update(
            'POST',
            @uri,
            data=data,
        )
        
        return AddressInstance(
            self._version,
            payload,
            account_sid: @solution['account_sid'],
            sid: @solution['sid'],
        )
      end
      
      def dependent_phone_numbers
        unless @dependent_phone_numbers
          @dependent_phone_numbers = DependentPhoneNumberList.new(
              @version,
              account_sid: @solution[:account_sid],
              address_sid: @solution[:sid],
          )
        end
        @dependent_phone_numbers
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Api.V2010.AddressContext #{context}>"
      end
    end
  
    class AddressInstance < InstanceResource
      def initialize(version, payload, account_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'city' => payload['city'],
            'customer_name' => payload['customer_name'],
            'date_created' => Time.rfc2822(payload['date_created']),
            'date_updated' => Time.rfc2822(payload['date_updated']),
            'friendly_name' => payload['friendly_name'],
            'iso_country' => payload['iso_country'],
            'postal_code' => payload['postal_code'],
            'region' => payload['region'],
            'sid' => payload['sid'],
            'street' => payload['street'],
            'uri' => payload['uri'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'account_sid' => account_sid,
            'sid' => sid || @properties['sid'],
        }
      end
      
      def _context
        unless @instance_context
          @instance_context = AddressContext(
              @version,
              @params['account_sid'],
              @params['sid'],
          )
        end
        @instance_context
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def city
        @properties['city']
      end
      
      def customer_name
        @properties['customer_name']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def friendly_name
        @properties['friendly_name']
      end
      
      def iso_country
        @properties['iso_country']
      end
      
      def postal_code
        @properties['postal_code']
      end
      
      def region
        @properties['region']
      end
      
      def sid
        @properties['sid']
      end
      
      def street
        @properties['street']
      end
      
      def uri
        @properties['uri']
      end
      
      ##
      # Deletes the AddressInstance
      def delete
        @context.delete()
      end
      
      ##
      # Fetch a AddressInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Update the AddressInstance
      def update(friendly_name: nil, customer_name: nil, street: nil, city: nil, region: nil, postal_code: nil)
        @context.update(
            customer_name: nil,
            street: nil,
            city: nil,
            region: nil,
            postal_code: nil,
        )
      end
      
      def dependent_phone_numbers
        @context.dependent_phone_numbers
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Api.V2010.AddressInstance #{context}>"
      end
    end
  end
end
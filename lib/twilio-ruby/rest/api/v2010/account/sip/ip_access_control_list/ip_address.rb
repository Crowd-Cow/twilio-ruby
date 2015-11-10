##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class IpAddressList < ListResource
      ##
      # Initialize the IpAddressList
      def initialize(version, account_sid, ip_access_control_list_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid,
            'ip_access_control_list_sid' => ip_access_control_list_sid
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/SIP/IpAccessControlLists/#{@solution[:ip_access_control_list_sid]}/IpAddresses.json"
      end
      
      ##
      # Reads IpAddressInstance records from the API as a list.
      def read(limit: nil, page_size: nil)
        @version.read(
            page_size: nil
        )
      end
      
      ##
      # Retrieve a single page of IpAddressInstance records from the API.
      def page(page_token: nil, page_number: nil, page_size: nil)
        params = {
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        response = @version.page(
            'GET',
            @uri,
            params
        )
        return IpAddressPage.new(
            @version,
            response,
            account_sid: @solution['account_sid'],
            ip_access_control_list_sid: @solution['ip_access_control_list_sid'],
        )
      end
      
      ##
      # Create a new IpAddressInstance
      def create(friendly_name, ip_address)
        data = {
            'FriendlyName' => friendly_name,
            'IpAddress' => ip_address,
        }
        
        payload = @version.create(
            'POST',
            @uri,
            data
        )
        
        return IpAddressInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
            ip_access_control_list_sid: @solution['ip_access_control_list_sid'],
        )
      end
      
      ##
      # Constructs a IpAddressContext
      def get(sid)
        IpAddressContext.new(@version, sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.IpAddressList>'
      end
    end
  
    class IpAddressContext < InstanceContext
      def initialize(version, account_sid, ip_access_control_list_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid,
            'ip_access_control_list_sid' => ip_access_control_list_sid,
            'sid' => sid,
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/SIP/IpAccessControlLists/#{@solution[:ip_access_control_list_sid]}/IpAddresses/#{@solution[:sid]}.json"
      end
      
      ##
      # Fetch a IpAddressInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return IpAddressInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
            ip_access_control_list_sid: @solution['ip_access_control_list_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Update the IpAddressInstance
      def update(ip_address, friendly_name)
        data = {
            'IpAddress' => ip_address,
            'FriendlyName' => friendly_name,
        }
        
        payload = @version.update(
            'POST',
            @uri,
            data=data,
        )
        
        return IpAddressInstance(
            self._version,
            payload,
            account_sid: @solution['account_sid'],
            ip_access_control_list_sid: @solution['ip_access_control_list_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Deletes the IpAddressInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Api.V2010.IpAddressContext #{context}>"
      end
    end
  
    class IpAddressInstance < InstanceResource
      def initialize(version, payload, account_sid, ip_access_control_list_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'sid' => payload['sid'],
            'account_sid' => payload['account_sid'],
            'friendly_name' => payload['friendly_name'],
            'ip_address' => payload['ip_address'],
            'ip_access_control_list_sid' => payload['ip_access_control_list_sid'],
            'date_created' => Time.rfc2822(payload['date_created']),
            'date_updated' => Time.rfc2822(payload['date_updated']),
            'uri' => payload['uri'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'account_sid' => account_sid,
            'ip_access_control_list_sid' => ip_access_control_list_sid,
            'sid' => sid || @properties['sid'],
        }
      end
      
      def _context
        unless @instance_context
          @instance_context = IpAddressContext(
              @version,
              @params['account_sid'],
              @params['ip_access_control_list_sid'],
              @params['sid'],
          )
        end
        @instance_context
      end
      
      def sid
        @properties['sid']
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def friendly_name
        @properties['friendly_name']
      end
      
      def ip_address
        @properties['ip_address']
      end
      
      def ip_access_control_list_sid
        @properties['ip_access_control_list_sid']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def uri
        @properties['uri']
      end
      
      ##
      # Fetch a IpAddressInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Update the IpAddressInstance
      def update(ip_address, friendly_name)
        @context.update(
            friendly_name,
        )
      end
      
      ##
      # Deletes the IpAddressInstance
      def delete
        @context.delete()
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Api.V2010.IpAddressInstance #{context}>"
      end
    end
  end
end
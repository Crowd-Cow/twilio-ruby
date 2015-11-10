##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class FeedbackSummaryList < ListResource
      ##
      # Initialize the FeedbackSummaryList
      def initialize(version, account_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/Calls/FeedbackSummary.json"
      end
      
      ##
      # Create a new FeedbackSummaryInstance
      def create(start_date, end_date, include_subaccounts: nil, status_callback: nil, status_callback_method: nil)
        data = {
            'StartDate' => start_date.iso8601,
            'EndDate' => end_date.iso8601,
            'IncludeSubaccounts' => include_subaccounts,
            'StatusCallback' => status_callback,
            'StatusCallbackMethod' => status_callback_method,
        }
        
        payload = @version.create(
            'POST',
            @uri,
            data
        )
        
        return FeedbackSummaryInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
        )
      end
      
      ##
      # Constructs a FeedbackSummaryContext
      def get(sid)
        FeedbackSummaryContext.new(@version, sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.FeedbackSummaryList>'
      end
    end
  
    class FeedbackSummaryContext < InstanceContext
      def initialize(version, account_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid,
            'sid' => sid,
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/Calls/FeedbackSummary/#{@solution[:sid]}.json"
      end
      
      ##
      # Fetch a FeedbackSummaryInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return FeedbackSummaryInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Deletes the FeedbackSummaryInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Api.V2010.FeedbackSummaryContext #{context}>"
      end
    end
  
    class FeedbackSummaryInstance < InstanceResource
      def initialize(version, payload, account_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'call_count' => payload['call_count'].to_i,
            'call_feedback_count' => payload['call_feedback_count'].to_i,
            'date_created' => Time.rfc2822(payload['date_created']),
            'date_updated' => Time.rfc2822(payload['date_updated']),
            'end_date' => Time.rfc2822(payload['end_date']),
            'include_subaccounts' => payload['include_subaccounts'],
            'issues' => payload['issues'],
            'quality_score_average' => payload['quality_score_average'].to_f,
            'quality_score_median' => payload['quality_score_median'].to_f,
            'quality_score_standard_deviation' => payload['quality_score_standard_deviation'].to_f,
            'sid' => payload['sid'],
            'start_date' => Time.rfc2822(payload['start_date']),
            'status' => payload['status'],
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
          @instance_context = FeedbackSummaryContext(
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
      
      def call_count
        @properties['call_count']
      end
      
      def call_feedback_count
        @properties['call_feedback_count']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def end_date
        @properties['end_date']
      end
      
      def include_subaccounts
        @properties['include_subaccounts']
      end
      
      def issues
        @properties['issues']
      end
      
      def quality_score_average
        @properties['quality_score_average']
      end
      
      def quality_score_median
        @properties['quality_score_median']
      end
      
      def quality_score_standard_deviation
        @properties['quality_score_standard_deviation']
      end
      
      def sid
        @properties['sid']
      end
      
      def start_date
        @properties['start_date']
      end
      
      def status
        @properties['status']
      end
      
      ##
      # Fetch a FeedbackSummaryInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Deletes the FeedbackSummaryInstance
      def delete
        @context.delete()
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Api.V2010.FeedbackSummaryInstance #{context}>"
      end
    end
  end
end
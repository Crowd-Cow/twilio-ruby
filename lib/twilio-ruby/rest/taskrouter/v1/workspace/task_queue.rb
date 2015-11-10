##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class TaskQueueList < ListResource
      ##
      # Initialize the TaskQueueList
      def initialize(version, workspace_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'workspace_sid' => workspace_sid
        }
        @uri = "/Workspaces/#{@solution[:workspace_sid]}/TaskQueues"
        
        # Components
        @statistics = nil
      end
      
      ##
      # Reads TaskQueueInstance records from the API as a list.
      def read(friendly_name: nil, evaluate_worker_attributes: nil, limit: nil, page_size: nil)
        @version.read(
            evaluate_worker_attributes: nil,
            limit: nil,
            page_size: nil
        )
      end
      
      ##
      # Retrieve a single page of TaskQueueInstance records from the API.
      def page(friendly_name: nil, evaluate_worker_attributes: nil, page_token: nil, page_number: nil, page_size: nil)
        params = {
            'FriendlyName' => friendly_name,
            'EvaluateWorkerAttributes' => evaluate_worker_attributes,
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        response = @version.page(
            'GET',
            @uri,
            params
        )
        return TaskQueuePage.new(
            @version,
            response,
            workspace_sid: @solution['workspace_sid'],
        )
      end
      
      ##
      # Create a new TaskQueueInstance
      def create(friendly_name, reservation_activity_sid, assignment_activity_sid, target_workers: nil, max_reserved_workers: nil)
        data = {
            'FriendlyName' => friendly_name,
            'ReservationActivitySid' => reservation_activity_sid,
            'AssignmentActivitySid' => assignment_activity_sid,
            'TargetWorkers' => target_workers,
            'MaxReservedWorkers' => max_reserved_workers,
        }
        
        payload = @version.create(
            'POST',
            @uri,
            data
        )
        
        return TaskQueueInstance.new(
            @version,
            payload,
            workspace_sid: @solution['workspace_sid'],
        )
      end
      
      ##
      # Access the statistics
      def statistics
        @statistics ||= TaskQueuesStatisticsList.new(@version, @solution)
      end
      
      ##
      # Constructs a TaskQueueContext
      def get(sid)
        TaskQueueContext.new(@version, sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Taskrouter.V1.TaskQueueList>'
      end
    end
  
    class TaskQueueContext < InstanceContext
      def initialize(version, workspace_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            'workspace_sid' => workspace_sid,
            'sid' => sid,
        }
        @uri = "/Workspaces/#{@solution[:workspace_sid]}/TaskQueues/#{@solution[:sid]}"
        
        # Dependents
        @statistics = nil
      end
      
      ##
      # Fetch a TaskQueueInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return TaskQueueInstance.new(
            @version,
            payload,
            workspace_sid: @solution['workspace_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Update the TaskQueueInstance
      def update(friendly_name: nil, target_workers: nil, reservation_activity_sid: nil, assignment_activity_sid: nil, max_reserved_workers: nil)
        data = {
            'FriendlyName' => friendly_name,
            'TargetWorkers' => target_workers,
            'ReservationActivitySid' => reservation_activity_sid,
            'AssignmentActivitySid' => assignment_activity_sid,
            'MaxReservedWorkers' => max_reserved_workers,
        }
        
        payload = @version.update(
            'POST',
            @uri,
            data=data,
        )
        
        return TaskQueueInstance(
            self._version,
            payload,
            workspace_sid: @solution['workspace_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Deletes the TaskQueueInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      def statistics
        unless @statistics
          @statistics = TaskQueueStatisticsList.new(
              @version,
              workspace_sid: @solution[:workspace_sid],
              task_queue_sid: @solution[:sid],
          )
        end
        @statistics
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Taskrouter.V1.TaskQueueContext #{context}>"
      end
    end
  
    class TaskQueueInstance < InstanceResource
      def initialize(version, payload, workspace_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'assignment_activity_sid' => payload['assignment_activity_sid'],
            'assignment_activity_name' => payload['assignment_activity_name'],
            'date_created' => Time.iso8601(payload['date_created']),
            'date_updated' => Time.iso8601(payload['date_updated']),
            'friendly_name' => payload['friendly_name'],
            'max_reserved_workers' => payload['max_reserved_workers'].to_i,
            'reservation_activity_sid' => payload['reservation_activity_sid'],
            'reservation_activity_name' => payload['reservation_activity_name'],
            'sid' => payload['sid'],
            'target_workers' => payload['target_workers'],
            'url' => payload['url'],
            'workspace_sid' => payload['workspace_sid'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'workspace_sid' => workspace_sid,
            'sid' => sid || @properties['sid'],
        }
      end
      
      def _context
        unless @instance_context
          @instance_context = TaskQueueContext(
              @version,
              @params['workspace_sid'],
              @params['sid'],
          )
        end
        @instance_context
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def assignment_activity_sid
        @properties['assignment_activity_sid']
      end
      
      def assignment_activity_name
        @properties['assignment_activity_name']
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
      
      def max_reserved_workers
        @properties['max_reserved_workers']
      end
      
      def reservation_activity_sid
        @properties['reservation_activity_sid']
      end
      
      def reservation_activity_name
        @properties['reservation_activity_name']
      end
      
      def sid
        @properties['sid']
      end
      
      def target_workers
        @properties['target_workers']
      end
      
      def url
        @properties['url']
      end
      
      def workspace_sid
        @properties['workspace_sid']
      end
      
      ##
      # Fetch a TaskQueueInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Update the TaskQueueInstance
      def update(friendly_name: nil, target_workers: nil, reservation_activity_sid: nil, assignment_activity_sid: nil, max_reserved_workers: nil)
        @context.update(
            target_workers: nil,
            reservation_activity_sid: nil,
            assignment_activity_sid: nil,
            max_reserved_workers: nil,
        )
      end
      
      ##
      # Deletes the TaskQueueInstance
      def delete
        @context.delete()
      end
      
      def statistics
        @context.statistics
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Taskrouter.V1.TaskQueueInstance #{context}>"
      end
    end
  end
end
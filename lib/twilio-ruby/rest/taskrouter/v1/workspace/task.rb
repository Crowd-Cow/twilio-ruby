##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class TaskList < ListResource
      ##
      # Initialize the TaskList
      def initialize(version, workspace_sid)
        super(version)
        
        # Path Solution
        @solution = {
            'workspace_sid' => workspace_sid
        }
        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Tasks"
      end
      
      ##
      # Reads TaskInstance records from the API as a list.
      def read(priority: nil, assignment_status: nil, workflow_sid: nil, workflow_name: nil, task_queue_sid: nil, task_queue_name: nil, limit: nil, page_size: nil)
        @version.read(
            assignment_status: nil,
            workflow_sid: nil,
            workflow_name: nil,
            task_queue_sid: nil,
            task_queue_name: nil,
            limit: nil,
            page_size: nil
        )
      end
      
      ##
      # Retrieve a single page of TaskInstance records from the API.
      def page(priority: nil, assignment_status: nil, workflow_sid: nil, workflow_name: nil, task_queue_sid: nil, task_queue_name: nil, page_token: nil, page_number: nil, page_size: nil)
        params = {
            'Priority' => priority,
            'AssignmentStatus' => assignment_status,
            'WorkflowSid' => workflow_sid,
            'WorkflowName' => workflow_name,
            'TaskQueueSid' => task_queue_sid,
            'TaskQueueName' => task_queue_name,
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        response = @version.page(
            'GET',
            @uri,
            params
        )
        return TaskPage.new(
            @version,
            response,
            workspace_sid: @solution['workspace_sid'],
        )
      end
      
      ##
      # Create a new TaskInstance
      def create(attributes, workflow_sid, timeout: nil, priority: nil)
        data = {
            'Attributes' => attributes,
            'WorkflowSid' => workflow_sid,
            'Timeout' => timeout,
            'Priority' => priority,
        }
        
        payload = @version.create(
            'POST',
            @uri,
            data
        )
        
        return TaskInstance.new(
            @version,
            payload,
            workspace_sid: @solution['workspace_sid'],
        )
      end
      
      ##
      # Constructs a TaskContext
      def get(sid)
        TaskContext.new(@version, sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Taskrouter.V1.TaskList>'
      end
    end
  
    class TaskContext < InstanceContext
      def initialize(version, workspace_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            'workspace_sid' => workspace_sid,
            'sid' => sid,
        }
        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Tasks/#{@solution[:sid]}"
        
        # Dependents
        @reservations = nil
      end
      
      ##
      # Fetch a TaskInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return TaskInstance.new(
            @version,
            payload,
            workspace_sid: @solution['workspace_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Update the TaskInstance
      def update(attributes: nil, assignment_status: nil, reason: nil, priority: nil)
        data = {
            'Attributes' => attributes,
            'AssignmentStatus' => assignment_status,
            'Reason' => reason,
            'Priority' => priority,
        }
        
        payload = @version.update(
            'POST',
            @uri,
            data=data,
        )
        
        return TaskInstance(
            self._version,
            payload,
            workspace_sid: @solution['workspace_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Deletes the TaskInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      def reservations
        unless @reservations
          @reservations = ReservationList.new(
              @version,
              workspace_sid: @solution[:workspace_sid],
              task_sid: @solution[:sid],
          )
        end
        @reservations
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Taskrouter.V1.TaskContext #{context}>"
      end
    end
  
    class TaskInstance < InstanceResource
      def initialize(version, payload, workspace_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'age' => payload['age'].to_i,
            'assignment_status' => payload['assignment_status'],
            'attributes' => payload['attributes'],
            'date_created' => Time.iso8601(payload['date_created']),
            'date_updated' => Time.iso8601(payload['date_updated']),
            'priority' => payload['priority'].to_i,
            'reason' => payload['reason'],
            'sid' => payload['sid'],
            'task_queue_sid' => payload['task_queue_sid'],
            'timeout' => payload['timeout'].to_i,
            'workflow_sid' => payload['workflow_sid'],
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
          @instance_context = TaskContext(
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
      
      def age
        @properties['age']
      end
      
      def assignment_status
        @properties['assignment_status']
      end
      
      def attributes
        @properties['attributes']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def priority
        @properties['priority']
      end
      
      def reason
        @properties['reason']
      end
      
      def sid
        @properties['sid']
      end
      
      def task_queue_sid
        @properties['task_queue_sid']
      end
      
      def timeout
        @properties['timeout']
      end
      
      def workflow_sid
        @properties['workflow_sid']
      end
      
      def workspace_sid
        @properties['workspace_sid']
      end
      
      ##
      # Fetch a TaskInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Update the TaskInstance
      def update(attributes: nil, assignment_status: nil, reason: nil, priority: nil)
        @context.update(
            assignment_status: nil,
            reason: nil,
            priority: nil,
        )
      end
      
      ##
      # Deletes the TaskInstance
      def delete
        @context.delete()
      end
      
      def reservations
        @context.reservations
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Taskrouter.V1.TaskInstance #{context}>"
      end
    end
  end
end
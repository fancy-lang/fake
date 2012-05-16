class Fake {
  class NamespaceBuilder {
    read_slot: 'tasks
    def initialize: @body name: @name {
      @tasks = TaskBuilder new: @body . tasks map: |name task| {
        nested_name = "#{@name}:#{name}"
        task name: nested_name
        (nested_name , task)
      } . to_hash
    }
  }

  class TaskBuilder {
    read_slot: 'tasks
    def initialize: @block {
      @tasks = <[]>
      tasks_hash = @block to_hash
      helpers = tasks_hash fetch: 'helpers else: { <[]> }
      tasks_hash delete: 'helpers
      helpers to_hash each: |name block| {
        match block arity {
          case 0 -> Task define_method: (name to_s) with: block
          case _ -> Task define_method: (name to_s + ":") with: |args| {
            block call: (args to_a) with_receiver: self
          }
        }
      }

      tasks_hash map: |name body| {
        task_opts = body to_hash
        desc = task_opts fetch: 'desc else: { "" }
        dependencies = task_opts fetch: 'depends else: { [] }
        run_block = task_opts['run]

        # handle_namespace
        if: run_block then: {
          task = Task new: @{
            name: name
            description: desc
            block: run_block
            dependencies: dependencies
          }
          @tasks[name to_s]: task
        } else: {
          ns_tasks = NamespaceBuilder new: body name: name . tasks
          @tasks merge!: ns_tasks
        }
     }
    }
  }
}
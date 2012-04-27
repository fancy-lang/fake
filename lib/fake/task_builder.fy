class Fake {
  class TaskBuilder {
    read_slot: 'tasks
    def initialize: @block {
      @tasks = <[]>
      @block to_hash map: |name body| {
        task_opts = body to_hash
        desc = task_opts fetch: 'desc else: { "" }
        dependencies = task_opts fetch: 'depends else: { [] }
        run_block = task_opts fetch: 'run else: { {} }
        @tasks[name]: $ Task new: name description: desc block: run_block dependencies: dependencies
      }
    }
  }
}
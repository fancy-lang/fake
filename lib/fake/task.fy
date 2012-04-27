class Fake {
  class Task {
    read_slots: ('name, 'description, 'block, 'dependencies)
    def initialize: @name description: @description block: @block ({}) dependencies: @dependencies ([]);

    def run {
      @dependencies
    }

    def inspect {
      deps = unless: (dependencies empty?) then: { "dependencies:" + (dependencies join: ",") } else: { "" }
      "<Task:#{name} description:#{description inspect} #{deps}>"
    }
  }
}
class Fake {
  class Task {
    include: TaskUtils

    read_slots: ('name, 'description, 'block, 'dependencies)
    def initialize: @name description: @description block: @block ({}) dependencies: @dependencies ([]);

    def ran? {
      @ran? true?
    }

    def run {
      @dependencies to_a map: |d| { Fake tasks[d to_sym] } . each: @{ run }

      unless: ran? do: {
        @block call_with_receiver: self
      }

      @ran? = true
    }

    def inspect {
      deps = unless: (dependencies empty?) then: { " dependencies:" + (dependencies join: ",") } else: { "" }
      "<Task:#{name} description:#{description inspect}#{deps}>"
    }
  }
}
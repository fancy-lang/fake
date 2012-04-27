class Fake {
  class Task {
    read_slots: ('name, 'block, 'dependencies)
    def initialize: @name block: @block ({}) dependencies: @dependencies ([]);

    def run {
      @dependencies
    }
  }
}
class Fake CLI {
  class Command {
    class ClassMethods {
      read_write_slots: ('command_name, 'option_flag, 'expects_argument?)
    }

    def self included: command_class {
      command_class extend: ClassMethods
      Fake CLI register_command: command_class
    }
  }
}
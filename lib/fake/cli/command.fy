class Fake CLI {
  class Command {
    class ClassMethods {
      read_write_slots: ('command_name, 'option_flag, 'argument_string, 'expects_argument?)
      def option_flag: @option_flag argument: @argument_string
    }

    def self included: command_class {
      command_class extend: ClassMethods
      Fake CLI register_command: command_class
    }
  }
}
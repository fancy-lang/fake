class Fake {
  class CLI
}

require: "cli/args"
require: "cli/command"

class Fake CLI {
  class ClassMethods {
    lazy_slot: 'commands value: { [] }

    def handle_arguments: argv {
      parse_argv: argv

      commands each: |c| {
        flag = c option_flag
        if: (argv includes?: flag) then: {
          if: (c expects_argument?) then: {
            c new run: (@args parse_option: flag)
          } else: {
            c new run
          }
        }
      }

      handle_tasks
    }

    def parse_argv: argv {
      @args = Args new: argv
      @fakefile = @args parse_option: "-f"
      Fake fakefile: @fakefile
    }

    def handle_tasks {

    }

    def register_command: command_class {
      commands << command_class
    }
  }

  extend: ClassMethods
}

require: "cli/commands"
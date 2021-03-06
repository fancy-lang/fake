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
    }

    def handle_tasks {
      Fake read_fakefile

      @args tasks each: |t| {
        if: (Fake tasks[t]) then: @{ run } else: {
          System abort: "Task '#{t}' not defined. Aborting."
        }
      }
    }

    def register_command: command_class {
      commands << command_class
    }
  }

  extend: ClassMethods
}

require: "cli/commands"
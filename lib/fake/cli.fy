class Fake {
  class CLI
}

require: "cli/args"

class Fake CLI {
  class ClassMethods {
    def handle_arguments: argv {
      parse_argv: argv
      Fake read_fakefile: @fakefile

      if: @show_tasks? then: {
        # find max name width
        max_width = Fake tasks values map: @{ name to_s size } . max
        Fake tasks each: |name t| {
          *stdout* printf("fake %-#{max_width}s  |  %s\n", name, t description)
        }
      }

      handle_tasks
    }

    def parse_argv: argv {
      @args = Args new: argv
      @fakefile = @args parse_option: "-f"
      @show_tasks? = argv includes?: "-T"
    }

    def handle_tasks {

    }
  }

  extend: ClassMethods
}
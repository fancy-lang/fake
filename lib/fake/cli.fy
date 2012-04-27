class Fake {
  class CLI
}

require: "cli/args"

class Fake {
  class CLI {
    def CLI handle_arguments: argv {
      parse_argv: argv
      Fake read_fakefile: @fakefile
    }

    def CLI parse_argv: argv {
      @args = Args new: argv
      @fakefile = @args parse_option: "-f"
    }
  }
}
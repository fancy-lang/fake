class Fake CLI Commands {
  class ShowHelp {
    include: Fake CLI Command

    command_name: "Show this help message"
    option_flag: "--help"
    expects_argument?: false

    def run {
      # find max command width
      max_width = Fake CLI commands map: @{ command_name to_s size } . max
      Fake CLI commands each: |c| {
        *stdout* printf("%-#{max_width}s  |  %s\n", c command_name, c option_flag)
      }

      System exit: 0
    }
  }
}

class Fake CLI Commands {
  class CustomFakefile {
    include: Fake CLI Command

    command_name: "Specify a custom path to Fakefile"
    option_flag: "-f" argument: "<path/to/Fakefile>"
    expects_argument?: true

    def run: fakefile {
      Fake fakefile: fakefile
    }
  }
}

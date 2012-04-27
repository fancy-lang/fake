class Fake CLI Commands {
  class ShowTasks {
    include: Fake CLI Command

    command_name: "Show available tasks"
    option_flag: "-T"
    expects_argument?: false

    def run {
      # find max name width
      Fake read_fakefile
      max_width = Fake tasks values map: @{ name to_s size } . max
      Fake tasks values sort_by: 'name . each: |t| {
        *stdout* printf("fake %-#{max_width}s  |  %s\n", t name, t description)
      }

      System exit: 0
    }
  }
}

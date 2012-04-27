class Fake CLI Commands {
  class Version {
    include: Fake CLI Command

    command_name: "Display Fake's version"
    option_flag: "--version"
    expects_argument?: false

    def run {
      "Fake #{Fake VERSION}" println
      "Copyright (C) 2012 Christopher Bertels chris@fancy-lang.org" println
      System exit: 0
    }
  }
}

class Fake {
  class TaskUtils {
    def sh: shell_args {
      cmd = []
      shell_args each: |arg| {
        arg to_a each: |x| {
          cmd << x
        }
      }
      cmd = cmd join: " "
      "#{cmd}" println
      System do: cmd
    }
  }
}
class Fake {
  class TaskUtils {
    def sh: shell_args {
      cmd = []
      shell_args to_a each: |arg| {
        arg to_a each: |x| {
          cmd << x
        }
      }
      cmd = cmd join: " "
      System do: cmd
    }
  }
}
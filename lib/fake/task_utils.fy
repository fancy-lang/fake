class Fake {
  class TaskUtils {
    def sh: shell_args verbose: verbose (false) {
      cmd = []
      if: *fake_path* then: {
        cmd << "cd #{*fake_path*} &&"
      }
      shell_args to_a each: |arg| {
        arg to_a each: |x| {
          cmd << x
        }
      }
      cmd = cmd join: " "
      { cmd println } if: verbose
      System do: cmd
    }

    def cd: path do: block {
      curr_dir = `pwd`
      let: '*fake_path* be: path in: {
        block call: [path]
      }
    }
  }
}
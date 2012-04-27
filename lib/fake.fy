class Fake

require: "fake/cli"
require: "fake/task"
require: "fake/task_builder"

class Fake {
  def Fake fakefile: fakefile {
    @fakefile = fakefile
  }

  def Fake tasks {
    @tasks || []
  }

  def Fake tasks: block {
    @tasks = TaskBuilder new: block . tasks
  }

  def Fake read_fakefile {
    try {
      File eval: @fakefile
    } catch Errno::ENOENT => e {
      *stderr* println: e
      System exit: 1
    }
  }
}
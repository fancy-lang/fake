class Fake

require: "fake/cli"
require: "fake/task_utils"
require: "fake/task"
require: "fake/task_builder"

class Fake {
  @tasks = <[]>

  def Fake fakefile: fakefile {
    @fakefile = fakefile
  }

  def Fake fakefile {
    @fakefile || "Fakefile"
  }

  def Fake tasks {
    @tasks
  }

  def Fake tasks: block {
    @tasks = TaskBuilder new: block . tasks
  }

  def Fake read_fakefile {
    try {
      File eval: fakefile
    } catch Errno::ENOENT => e {
      System abort: e
    }
  }
}
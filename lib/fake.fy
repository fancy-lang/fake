class Fake

require: "fake/task"
require: "fake/task_builder"
require: "fake/cli"

class Fake {
  def Fake tasks: block {
    TasksBuilder new: block . tasks
  }

  def Fake read_fakefile: fakefile ("Fakefile") {
    try {
      File eval: fakefile
    } catch Errno::ENOENT => e {
      *stderr* println: e
      System exit: 1
    }
  }
}
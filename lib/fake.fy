class Fake

require: "fake/cli"
require: "fake/task_utils"
require: "fake/task"
require: "fake/task_builder"
require: "fake/version"

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

  def Fake helpers: helpers {
    helpers to_hash each: |name block| {
      match block arity {
        case 0 -> Task define_method: (name to_s) with: block
        case _ -> Task define_method: (name to_s + ":") with: |args| {
          block call: (args to_a) with_receiver: self
        }
      }
    }
  }
}
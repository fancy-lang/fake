require: "lib/fake"

FancySpec describe: Fake Task with: {
  def task: block ({}) {
    Fake Task new: @{
      name: "foo"
      block: block
    }
  }

  it: "didn't run yet after creation" with: 'ran? when: {
    task_ran? = false
    t = task: { task_ran? = true }
    t ran? is: false
    task_ran? is: false
  }

  it: "runs the task correctly" with: 'run when: {
    task_ran? = false
    t = task: { task_ran? = true }
    t ran? is: false
    t run
    t ran? is: true
    task_ran? is: true
  }
}
# Fake - Fancy automation

Fake is a new work-in-progress build and automation tool for Fancy, similar to Ruby's Rake.

## Tasks

Fake allows the definition of tasks that may depend on other tasks to complete.

Given a `Fakefile` with the following contents:

```fancy
Fake tasks: {
  clean: {
    desc: "Remove all *.fyc files"
    run: {
      sh: ("rm", "-rf", Directory list: "**/*.fyc") verbose: true
    }
  }
}
```

You can invoke it like so:

```
$ fake clean
```

To list all available tasks run:

```
$ fake -T
fake clean    |  Remove all *.fyc files
```

To see a list of general options use the help command:

```
$ fake --help
```

## Specifying dependencies

You can specify dependencies via the `depends` option, like so:

```fancy
Fake tasks: {
  task_a: {
    desc: "This task shall be run before task_b"
    run: {
      "Running task a" println
    }
  }

  task_b: {
    desc: "This tasks depends on task_a"
    depends: 'task_a # pass an array of task names if you depend on more than one task
    run: {
      "Running task b" println
    }
  }
}
```

When no task is specified the `default` task will be run (as with Rake).

## Note:

This is still in the making. More features coming soon, but defining
basic tasks and dependencies between them works fine already.
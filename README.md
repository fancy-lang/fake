# Fake - Fancy Make

Fake is a build and automation tool for
[Fancy](http://www.fancy-lang.org), similar to Ruby's Rake.
You write your tasks in pure Fancy code, by default saving them to
`Fakefile`s.

A standard collection of common Fake tasks will be added soon.

## Installation

To install Fake use Fancy's built-in package system:

```
$ fancy install fancy-lang/fake
```

Also make sure that `~/.fancy/packages/bin` is in your `$PATH`
environment variable. Set it in your `~/.bash_profile` or similar:

```
export PATH=$PATH:~/.fancy/packages/bin
```

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

## Namespaces

You can place tasks in namespaces by placing them inside a named block
that doesn't contain its own `run` option:

```fancy
Fake tasks: {
  namespace_a: {
    task_a: {
      run: {
        # ...
      }
    }
  }

  namespace_b: {
    task_b: {
      depends: 'namespace_a:task_a
      run: {
        # ...
      }
    }
  }
}
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

This is still in the making. More features are coming soon, but defining
basic tasks and dependencies between them works already.
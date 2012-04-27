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

## Note:

This is still in the making. More features coming soon, but defining
basic tasks and dependencies between them works fine already.
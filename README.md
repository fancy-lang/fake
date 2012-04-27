# Fake - Fancy automation

Fake is a new work-in-progress build and automation tool for Fancy, similar to Ruby's Rake.

## Tasks

Fake allows the definition of tasks that may depend on other tasks to complete.
Given a task names `clean` you can invoke it like so:

```
$ fake clean
```


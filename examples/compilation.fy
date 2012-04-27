require: "fake"

Fake tasks: @{
  default: @{
    desc: "Compile all *.fy files"
    depends: []
    run: {
      sh: ("fancy", "-c", Directory find: "./**/*.fy")
    }
  }

  clean: @{
    desc: "Clean all *.fyc files"
    run: @{
      sh: ("rm", "-rf", Directory find: "./**/*.fyc")
    }
  }
}
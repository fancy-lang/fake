Fake tasks: {
  default: {
    desc: "Compile all *.fy files"
    depends: ['clean]
    run: {
      sh: ("fancy", "-c", Directory list: "./**/*.fy")
    }
  }

  clean: {
    desc: "Clean all *.fyc files"
    run: {
      sh: ("rm", "-rf", Directory list: "./**/*.fyc")
    }
  }
}
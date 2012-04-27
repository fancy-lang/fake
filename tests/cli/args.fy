require: "lib/fake/cli/args"

FancySpec describe: Fake CLI Args with: {
  def args: argv {
    Fake CLI Args new: argv
  }

  it: "returns the default value" for: 'parse_option: when: {
    args: [] . parse_option: "-f" . is: $ Fake CLI Args Defaults["-f"]
  }

  it: "returns the passed in value" for: 'parse_option: when: {
    args: ["-f", "MyCustomFakeFile"] . parse_option: "-f" . is: $ "MyCustomFakeFile"
  }
}
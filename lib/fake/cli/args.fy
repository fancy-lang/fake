class Fake {
  class CLI {
    class Args {
      Defaults = <[
        "-f" => "Fakefile"
      ]>

      def initialize: @argv
      def parse_option: opt {
        if: (@argv index: opt) then: |idx| {
          @argv[idx + 1]
        } else: {
          Defaults[opt]
        }
      }
    }
  }
}

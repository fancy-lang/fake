class Fake {
  class CLI {
    class Args {
      Defaults = <[
      ]>

      def initialize: @argv

      def parse_option: opt {
        if: (@argv index: opt) then: |idx| {
          @argv remove_at: idx
          val = @argv[idx]
          @argv remove_at: idx
        } else: {
          Defaults[opt]
        }
      }

      def tasks {
        match @argv size {
          case 0 -> ["default"]
          case _ -> @argv
        }
      }
    }
  }
}

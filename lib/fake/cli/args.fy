class Fake {
  class CLI {
    class Args {
      Defaults = <[
      ]>

      def initialize: @argv

      def parse_option: opt {
        if: (@argv index: opt) then: |idx| {
          @argv remove_at: idx
          @argv remove_at: idx # return value
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

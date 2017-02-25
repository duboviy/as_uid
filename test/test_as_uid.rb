require 'test/unit'
require 'fileutils'
require 'as_uid'


class AsUidTest < Test::Unit::TestCase
  def test_positive_scenario
      Dir.mkdir("as_root")
      assert_equal Process.uid, 0, 'Must run as root'
      assert_equal Process.uid, File.stat('as_root').uid, 'Must be root'
      FileUtils.rm_rf('as_root')

      Process.as_uid(1000) do
        assert_equal Process.uid, 1000, 'Must run as user'
        Dir.mkdir("as_user")
        assert_equal Process.uid, File.stat('as_user').uid, 'Must be user'
        assert_not_equal 'root', %x{whoami}, 'Must run as user'
        FileUtils.rm_rf('as_user')
      end

      Dir.mkdir("as_root")
      assert_equal Process.uid, 0, 'Must run as root'
      assert_equal Process.uid, File.stat('as_root').uid, 'Must be root'
      FileUtils.rm_rf('as_root')
  end
end

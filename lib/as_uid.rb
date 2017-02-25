require 'etc'

module Process

  def as_user(user_name)
    uid = Etc.getpwnam(user_name).uid

    Process.as_uid(uid) do
      yield
    end
  end

  def as_uid(uid)
    old_euid, old_uid = Process.euid, Process.uid
    Process.euid, Process.uid = uid, uid

    begin
      yield
    ensure
      Process.euid, Process.uid = old_euid, old_uid
    end
  end

  module_function(:as_user)
  module_function(:as_uid)
end

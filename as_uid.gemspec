Gem::Specification.new do |s|
  s.name               = "as_uid"
  s.version            = "0.0.3"
  s.default_executable = "as_uid"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eugene Duboviy"]
  s.date = %q{2017-02-26}
  s.description = %q{Use to run code as another user}
  s.email = %q{eugene.dubovoy@gmail.com}
  s.files = ["Rakefile", "lib/as_uid.rb", "bin/as_uid", "bin/as_user"]
  s.test_files = ["test/test_as_uid.rb"]
  s.homepage = %q{http://rubygems.org/gems/as_uid}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{As_uid!}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end


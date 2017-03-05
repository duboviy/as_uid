<h1><img src="https://raw.githubusercontent.com/duboviy/as_uid/master/logo.jpg" height=65 alt="logo" title="logo"> as_uid</h1>

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/8d0084e6036c4871b801b20717b9e128)](https://www.codacy.com/app/dubovoy/as_uid?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=duboviy/as_uid&amp;utm_campaign=Badge_Grade) [![Open Source Love](https://badges.frapsoft.com/os/mit/mit.svg?v=102)](https://github.com/duboviy/as_uid/) [![PRs & Issues Welcome](https://img.shields.io/badge/PRs%20&%20Issues-welcome-brightgreen.svg)](https://github.com/duboviy/as_uid/pulls) [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/duboviy/as_uid/)

Gem utility made to run code as another user 

## Summary
When you have a system administration or automation task and you decide to write a Ruby script that runs as root,
but you need to take some actions on behalf of another user (e.g. run an external program or create a file).

## Installation

[Install gem](https://rubygems.org/gems/as_uid):
```bash
gem install as_uid
```
Or build locally and install:
```bash
gem build as_uid.gemspec
gem install ./as_uid-0.0.3.gem
```

## Basic usage examples

Imagine that on your system the account *user* has UID 1000. When run as
root, this code will create one directory owned by *root* and one owned by *user*:
```ruby
Dir.mkdir("as_root")

Process.as_uid(1000) do
  Dir.mkdir("as_user")
  %x{whoami}
end
# => "user\n"
```
Here are the directories:
```bash
$ ls -ld as_*
drwxr-xr-x 2 user root 4096 Feb 2 13:06 as_user/
drwxr-xr-x 2 root root 4096 Feb 2 13:06 as_root/
```

When you’re switching to another user, your permissions are restricted to what that
user can do. We can’t remove the as_root directory as a nonroot user (with custom *user*),
because I created it as root:
```ruby
Process.as_uid(1000) do
  Dir.rmdir("as_root")
end
# Errno::EPERM: Operation not permitted - as_root
Dir.rmdir("as_root") # => 0
```

## Tests

To run tests use following command:
```bash
sudo rake test
```
*Note: You should use sudo because root privileges are expected in test scenarios.* 

## Binary script
Example run of binary script: 
```
ruby -Ilib ./bin/as_uid 1000 "mkdir 123"
```

## License

**MIT** licensed library. See [LICENSE](LICENSE) for details.

## Contributing

If you have suggestions for improving the as_uid, please [open an issue or
pull request on GitHub](https://github.com/duboviy/as_uid/).

## Badges

[![forthebadge](http://forthebadge.com/images/badges/fuck-it-ship-it.svg)](https://github.com/duboviy/as_uid/)
[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](https://github.com/duboviy/as_uid/) [![forthebadge](http://forthebadge.com/images/badges/built-by-hipsters.svg)](https://github.com/duboviy/as_uid/) [![forthebadge](http://forthebadge.com/images/badges/built-with-swag.svg)](https://github.com/duboviy/as_uid/)

[![forthebadge](http://forthebadge.com/images/badges/powered-by-electricity.svg)](https://github.com/duboviy/as_uid/) [![forthebadge](http://forthebadge.com/images/badges/powered-by-oxygen.svg)](https://github.com/duboviy/as_uid/) [![forthebadge](http://forthebadge.com/images/badges/powered-by-water.svg)](https://github.com/duboviy/as_uid/) [![forthebadge](http://forthebadge.com/images/badges/powered-by-responsibility.svg)](https://github.com/duboviy/as_uid/)

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://github.com/ellerbrock/open-source-badge/)

[![forthebadge](http://forthebadge.com/images/badges/makes-people-smile.svg)](https://github.com/duboviy/as_uid/)

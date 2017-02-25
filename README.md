##[Install gem](https://rubygems.org/gems/as_uid):
sudo gem install as_uid

##Run tests:
sudo rake test

##To build locally and install:
gem build as_uid.gemspec
sudo gem install ./as_uid-0.0.2.gem

##Example run of binary script
ruby -Ilib ./bin/as_uid 1000 "mkdir 123"

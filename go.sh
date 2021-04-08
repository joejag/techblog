bundle --version || sudo gem install bundler --no-ri --no-rdoc
bundle check || bundle install
bundle exec jekyll serve

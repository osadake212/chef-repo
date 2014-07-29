include_recipe "rbenv::default"

# create plugins directory
directory "/usr/local/src/rbenv/plugins" do
  mode "0755"
  action :create
  user user
  group group
  not_if { File.exist?('/usr/local/src/rbenv/plugins') }
end

# checkout ruby-build
git "/usr/local/src/rbenv/plugins/ruby-build" do
  repository "https://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout
  user user
  group group
  not_if { File.exist?('/usr/local/src/rbenv/plugins/ruby-build') }
end

execute "ruby install" do
  not_if "source /etc/profile.d/rbenv.sh; rbenv versions | grep 2.0.0-p451"
  command "source /etc/profile.d/rbenv.sh; rbenv install 2.0.0-p451"
  action :run
end

execute "ruby change" do
  command "source /etc/profile.d/rbenv.sh; rbenv global 2.0.0-p451; rbenv rehash"
  action :run
end

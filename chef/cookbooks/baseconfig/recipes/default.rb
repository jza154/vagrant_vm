# Make sure the Apt package lists are up to date, so we're downloading versions that exist.
cookbook_file "apt-sources.list" do
  path "/etc/apt/sources.list"
end
execute 'apt_update' do
  command 'apt-get update'
end

# Base configuration recipe in Chef.
package "wget"
package "tree"
package "ntp"
package "nginx"
package "postgresql"
package "wget"
package "ack-grep"
cookbook_file "ntp.conf" do
  path "/etc/ntp.conf"
end
cookbook_file "/var/www/html/index.html" do
	source "index.html"
	mode "0644"
	owner "root"
end
execute 'ntp_restart' do
  command 'service ntp restart'
end

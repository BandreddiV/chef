package "httpd"
package "php"
package "openssl"

service  'httpd' do
	action [:enable, :start]
end

execute "yum install mysql" do
  command "yum install -y --enablerepo=remi,epel mysql mysql-server mysql-libs"
  not_if "rpm -q mysql"
end
#
# chkconfig
#
execute "chkconfig mysqld on" do
  command "chkconfig mysqld on"
end
#
# Command
#
service "mysqld" do
  
  start_command   "/etc/init.d/mysqld start"
  
  action [:enable, :start]
end
execute "yum install php" do
    command "yum install -y php5 php-mysql php-pear"
	
end

#
# Cookbook Name:: node
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
package 'apache' do
  package_name 'httpd'
end

service 'httpd' do
  action [:enable, :start]
end

package 'git' do
end

git "/root/node-js-sample" do
	repository 'https://github.com/heroku/node-js-sample.git'
	action :checkout
end

bash 'install_something' do
	user 'root'
	code <<-EOH
	sudo su
	cd ~
	cd node-js-sample/
	curl --silent --location https://rpm.nodesource.com/setup_7.x | bash -
	yum install nodejs -y
	npm install
        npm install forever --global
        forever start index.js
	EOH
end

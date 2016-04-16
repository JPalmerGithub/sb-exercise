



include_recipe "nginx::default"



template '/etc/nginx/conf.d/balancer.conf' do
  source 'balancer.conf.erb'
  mode '0440'
  owner 'root'
  group 'root'
  variables :app_nodes => node['exercise']['app_nodes']
  notifies :reload, 'service[nginx]'
end

service "nginx" do
  action [ :enable, :start ]
end


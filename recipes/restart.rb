node[:deploy].each do |application, deploy|
  if node[:resque][application]
    service "resque-#{application}" do
      action [:stop, :start]
      provider Chef::Provider::Service::Upstart
    end
  end
end

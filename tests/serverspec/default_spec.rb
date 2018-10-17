require "spec_helper"
require "serverspec"

packages = case os[:family]
           when "freebsd"
             %w[ unzip gtar ]
           when "openbsd"
             %w[ unzip gtar ]
           when "ubuntu"
             %w[ unzip tar ]
           when "redhat"
             %w[ unzip tar ]
           end

packages.each do |p|
  describe package(p) do
    it { should be_installed }
  end
end

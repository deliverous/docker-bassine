require 'rake/docker_lib'


#directory ".target/deliverous" do
#  sh "git clone git@git.deliverous.com:deliverous/workspace .target/deliverous"
#end

#desc "Update upstream sources"
#task :update => ".target/deliverous" do
#  sh "cd .target/deliverous && git pull"
#end

Rake::DockerLib.new("deliverous/docker-workspace", version: '0.1.0-0')

#task prepare: :update
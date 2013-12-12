require "bundler/gem_tasks"

task :default => :test

desc "Ejecutar test"
task :test do

	
	sh "ruby -Ilib -Itest test/tc_matrix.rb"
end
desc "Crear documentacion rdoc"
task :rdoc do
	sh "rdoc --all"
end

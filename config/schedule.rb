# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
set :PATH, "/usr/local/bin"
set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}
set :bundle_command, "/home/local/usr/bin /bundle"
#chruby_version = 'ruby-2.4.1'
#chruby_bin = '/usr/local/bin/chruby-exec'
#chruby_cmd = "#{chruby_bin} #{chruby_version} --"
#job_type :rake,    "cd :path && #{chruby_cmd} :environment_variable=:environment bundle exec rake sync:feeds --silent :output"


puts"hi hello"
every 1.minutes, :roles => [:app] do
  rake "sync:feeds"
end
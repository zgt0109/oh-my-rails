gem 'whenever', '~> 0.9.7'

run_bundle

run "wheneverize ."

insert_into_file 'Capfile', :after => /require.*nginx.*\s/ do
  <<-EOS.strip_heredoc
    require "whenever/capistrano"
  EOS
end

# 设定日志文件
gsub_file 'config/schedule.rb', /(#\s+)(set\s+:output,).*/, '\2 "#{path}/log/cron_log.log"'

# Bundler 环境变量
insert_into_file 'config/schedule.rb', :before => /set\s+:output/ do
  <<-EOS.strip_heredoc
    env :PATH, ENV['PATH']

  EOS
end

git add: "."
git commit: %Q{ -m 'common:whenever' }

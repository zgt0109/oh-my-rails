require 'active_support/all'

def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

# fix not use version manage
ENV['BUNDLE_GEMFILE'] = "#{destination_root}/Gemfile"

after_bundle do
  git config: %Q{ --global user.name  "#{ask('name: ')}" }
  git config: %Q{ --global user.email  "#{ask('email: ')}" }
  git config: %Q{--global push.default simple}

  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }

  puts "common template processing..."
  apply  File.expand_path("../lib/common/docker.rb", __FILE__)
#   apply  File.expand_path("../lib/common/rspec.rb", __FILE__)
#   apply  File.expand_path("../lib/common/capistrano.rb", __FILE__)
#   apply  File.expand_path("../lib/common/app.rb", __FILE__)
#   apply  File.expand_path("../lib/common/i18n.rb", __FILE__)
#   apply  File.expand_path("../lib/common/db.rb", __FILE__)
#   apply  File.expand_path("../lib/common/whenever.rb", __FILE__)
#
#   if options[:api]
#     puts "api template processing..."
#     apply  File.expand_path("../lib/api/cors.rb", __FILE__)
#     apply  File.expand_path("../lib/api/json.rb", __FILE__)
#   else
#     puts "web template processing..."
#     apply  File.expand_path("../lib/web/app.rb", __FILE__)
#     apply  File.expand_path("../lib/web/livereload.rb", __FILE__)
#     apply  File.expand_path("../lib/web/semantic-ui.rb", __FILE__)
#   end
end

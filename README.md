# 开始工作

### References

* [Rails Application Templates](http://guides.rubyonrails.org/rails_application_templates.html) [中文参考](http://guides.ruby-china.org/rails_application_templates.html)
* [Thor](http://whatisthor.com/) [Actions](http://www.rubydoc.info/github/wycats/thor/Thor/Actions)

* [集成Gem列表](https://github.com/guxiaobai/developer-101/blob/master/ruby/gems.md)




### 使用教程
**生成项目**

	rails new <project_name> -T -d postgresql -m <path>/oh-my-rails/bootstrap.rb

**安装 Ruby**

	source <(curl -fsSL https://raw.githubusercontent.com/guxiaobai/oh-my-rails/master/bin/provision.sh)

**新增部署用户**

	source <(curl -fsSL https://raw.githubusercontent.com/guxiaobai/oh-my-rails/master/bin/deploy.sh)

### TODO

* `config/puma.rb` 完善
* 分页
* 队列
* 消息
* 备份
* 监控

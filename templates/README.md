# Rails(oh-my-rails)


### Requirment

* [Rails5]
* [Postgresql]
* [Memcache]
* [Redis]
* [RabbitMQ]

## Development

**Docker**

  docker-compose run web rails db:setup
  docker-compose up


**Vagrant**

  vagrant up

### Misc

**Paranoia**

useage

    rails generate migration AddDeletedAtToClients deleted_at:datetime:index

model

    acts_as_paranoid

rspec

    it_behaves_like 'a Paranoid model'


I18n

* `Model.model_name.human`
* `Model.human_attribute_name(attribute)`

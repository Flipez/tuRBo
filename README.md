![Flipez' Blog](slogan.png?raw=true "Flipez' Blog")

[![Code Climate](https://codeclimate.com/github/Flipez/tuRBo/badges/gpa.svg)](https://codeclimate.com/github/Flipez/tuRBo)

This branch holds the slightly modified version of turbo used by flipez' blog.
It'll be removed when turbo is modular enough.

## Installation

In order to deploy tuRBo just clone the repository
```
git clone https://github.com/Flipez/tuRBo.git
cd tuRBo
```

Then run Bundler with
```
bundle install
```

After that create the database with
```
rake db:migrate
```

## Configuration
### Basic
All major settings take place in `config/settings.yml`and `config/settings/`

However, it's recommended to only modify `config/settings/development.yml`and `config/settings/production.yml` since those will overwrite `config/settings.yml`. This will protect you from changes which may be made in the future. You can allways look into the default file to see what options you can adjust.

This is how the file looks in my configuration: 

```yaml
blog:
  title: "Flipez' Blog"
  subtitle: "Linux & IT-Fan, Nerd, Supertüp"
  url: &url "https://wingman.flipez.de"
social:
  rss:
    - *url
    - /feed?format=rss
  github: https://github.com/Flipez
  steam: https://steamcommunity.com/id/flipez
  flickr: https://flickr.com/photos/Flipez
  mail: mailto:rm@flipez.net
```

### Localization
You should have an idea what kind of settings you can adjust there, for localization you might take a look into `config/locales/`
There you can adjust the most of the strings found all over the views. You can change the default locale in `config/application.rb` with the `config.i18n.default_locale`attribut. Default is `:de`

### First Run
In order to login to the administration panel you need to create an account first. tuRBo considers every account as an admin - keep that in mind.
At first you need the console, type
```
rails c
```
To create an user you need to execute the following command
```ruby
User.create! name: :your_nickname, password: :supersecurepassword
```
However, Rails will tell you if some validation has failed. Now you can login to the adminpanel and create additional accounts. If you dont like clicking buttons, you can - of course - create all your posts in the console.


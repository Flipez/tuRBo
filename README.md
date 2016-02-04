![Flipez' Blog](slogan.png?raw=true "Flipez' Blog")

[![Code Climate](https://codeclimate.com/github/Flipez/tuRBo/badges/gpa.svg)](https://codeclimate.com/github/Flipez/tuRBo)

This branch holds the slightly modified version of turbo used by flipez' blog.
It'll be removed when turbo is modular enough.

## Installation

You need redis installed and running on your machine.

```
pacman -S redis
systemctl start redis
```

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
RAILS_ENV=production bundle exec rake db:migrate
```

and precompile the assets
```
RAILS_ENV=production bundle exec rake assets:precompile
```

## Configuration

### First Run
In order to login to the administration panel you need to create an account first. tuRBo considers every account as an admin - keep that in mind.
At first you need the console, type
```
RAILS_ENV=production bundle exec rails c
```
To create an user you need to execute the following command
```ruby
User.create! name: :your_nickname, password: :supersecurepassword
```
However, Rails will tell you if some validation has failed. Now you can login to the adminpanel and create additional accounts. If you dont like clicking buttons, you can - of course - create all your posts in the console.

### Basic
You can adjust nearly everything in the admin panel. Just go to settings and make your changes.

### Recaptcha
We are using Googles recaptcha to avoid automated comments. In order to use this service you have to get your api keys from Google and paste them into the `config/settings/production.yml` (and development if you wish) as shown in `config/settings.yml`.
[obtain a reCAPTCHA API key](https://www.google.com/recaptcha/admin).

### Localization
You should have an idea what kind of settings you can adjust there, for localization you might take a look into `config/locales/`
There you can adjust the most of the strings found all over the views.

# App: Lecteur de flux RSS

Il était demandé de développer un lecteur de flux rss, permettant de:
* ajouter un nouveau flux
* lire les flux et les ajouter en DB
* afficher le contenu des flux enregistrés
* changer le statut de chaque article en lu / non lu

Côté présentation, une maquette était à respecter.

## 📋 Tech :

Pour ce projet :

  * **Langage = Ruby** - 2.5.1
  * **Framework = Rails** - 6.0
  * **Base de données = MySQL** - 14.14
  * **Front-end = Ajax & React JS**

## 🖥 En local :

* **Lancer** `$ git clone "lien"`
* **Lancer** `$ bundle install`
* **Lancer** `$ rails db:create db:migrate db:seed`
* **Lancer** `$ rake feed_update:get_new_articles`
* **Lancer** `$ rails server`
* **Se rendre sur localhost:3000 via votre navigateur**

## Pour accorder les droits DB MySQL :

1. Créer un nouvel utilisateur & mot de passe
```
  $ sudo mysql
  $ mysql > CREATE USER 'admin_rss'@'localhost' IDENTIFIED BY 'password_rss';
```
3. Pour accorder les privilèges a l'utilisateur admin_rss pour les DB de développement et de test
```
  $ mysql > GRANT ALL PRIVILEGES ON lecteur_flux_rss_development.* TO 'admin_rss'@'localhost' WITH GRANT OPTION;
  $ mysql > GRANT ALL PRIVILEGES ON lecteur_flux_rss_test.* TO 'admin_rss'@'localhost' WITH GRANT OPTION;
```
4. Pour voir les DB existantes
```
  $ mysql > SHOW DATABASES;
  $ mysql > exit
```

## 💎 Les gems :
```
gem 'rails', '~> 6.0.0'
gem 'mysql2', '>= 0.4.4' → utilisation de MySql
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'
gem "react-rails", "~> 2.6" → utilisation de react
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'whenever', '~> 1.0' → permet d'ajouter un scheduler pour les tâches
gem 'rspec-rails', '~> 4.0.0.beta2' → pour effectuer les tests
gem 'guard-rspec', '~> 4.7', '>= 4.7.3', require: false → pour lancer les tests automatiquement
gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1' → pour créer des instances en test
gem 'database_cleaner', '~> 1.7' → pour nettoyer la DB après chaque test
gem 'faker', '~> 2.7' → pour créer de faux noms / texts / url
gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2' → helper pour faciliter l'écriture du code
gem 'rails-controller-testing'
gem 'capybara', '~> 2.7', '>= 2.7.1'
```

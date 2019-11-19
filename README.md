# App: Lecteur de flux RSS

Il était demandé de développer un lecteur de flux rss, permettant de:
* ajouter un nouveau flux
* lire les flux et les ajouter en DB
* afficher le contenu des flux enregistrés
* changer le statut de chaque article en lu / non lu

Côté présentation, une maquette était à respecter.

## 📋 Tech :

Pour ce projet :

  * Langage = **Ruby** - 2.5.1
  * Framework = **Rails** - 6.0
  La nouvelle version de Rails, avec laquelle je travaillais pour la première fois.
  * Base de données = **MySQL** - 14.14
  Idem, je n'avais encore jamais travaillé avec mysql, qui m'a donné du fil à retordre pour configurer les accès.. ! J'ai du créer un nouvel utilisateur et lui donner les droits d'accès pour les bases de données utilisées pour l'app (développement et test).
  * Front-end = **Ajax & React JS**
  L'une des premières fois aussi que j'ai réellement utilisé les fonctionnalités Rails en Ajax. Pour React JS, plutôt que de faire l'app en Ajax d'abord puis d'essayer de la transposer, j'ai voulu de suite faire du React. Or sans prendre le temps de suivre un vrai cours dessus, c'était présomptueux de ma part. Après m'être un peu casser les dents dessus, car l'on trouve de tout sur le net à son propos, j'ai donc décidé de revenir sur quelque chose que je pouvais mieux maîtriser: l'Ajax.
  Pour finir, j'ai tout de même réussi à créer un composant React: le formulaire qui permet d'ajouter un nouveau flux.

## 🖥 En local :

* **Lancer** `$ bundle install`
* **Lancer** `$ rails db:create db:migrate db:seed`
* **Lancer** `$ rake feed_update:get_new_articles`
* **Lancer** `$ rails server`
* **Se rendre sur localhost:3000 via votre navigateur**

## Pour accorder les droits DB MySql :

1. Pour voir les utilisateurs actuels
```
  $ sudo mysql
  $ mysql > SELECT user,authentication_string,plugin,host FROM mysql.user;
```
2. Créer un nouvel utilisateur & mot de passe
```
  $ mysql > CREATE USER 'admin_rss'@'localhost' IDENTIFIED BY 'password_rss';
```
3. Pour accorder les privil-ges a l'utilisateur admin_rss pour les DB de développement et de test
```
  $ mysql > GRANT ALL PRIVILEGES ON lecteur_flux_rss_development.* TO 'admin_rss'@'localhost' WITH GRANT OPTION;
  $ mysql > GRANT ALL PRIVILEGES ON lecteur_flux_rss_test.* TO 'admin_rss'@'localhost' WITH GRANT OPTION;
```
4. Pour voir les DB existantes
```
  $ mysql > SHOW DATABASES;
```

## 💎 Les gems :

* gem 'rails', '~> 6.0.0'
* gem 'mysql2', '>= 0.4.4' → utilisation de MySql
* gem 'puma', '~> 3.11'
* gem 'sass-rails', '~> 5'
* gem 'webpacker', '~> 4.0'
* gem "react-rails", "~> 2.6" → utilisation de react
* gem 'turbolinks', '~> 5'
* gem 'jbuilder', '~> 2.7'
* gem 'whenever', '~> 1.0' → permet d'ajouter un scheduler pour les tâches
* gem 'rspec-rails', '~> 4.0.0.beta2' → pour effectuer les tests
* gem 'guard-rspec', '~> 4.7', '>= 4.7.3', require: false → pour lancer les tests automatiquement
* gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1' → pour créer des instances en test
* gem 'database_cleaner', '~> 1.7' → pour nettoyer la DB après chaque test
* gem 'faker', '~> 2.7' → pour créer de faux noms / texts / url
* gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2' → helper pour faciliter l'écriture du code
* gem 'rails-controller-testing'
* gem 'capybara', '~> 2.7', '>= 2.7.1'

## 🎯 Les problématiques rencontrées :

Envoi de mails
==============

Ce script Ruby sert à envoyer des mails aux utilisateurs de LinuxFr.org qui
n'ont pas utilisé leur compte depuis le passage à la version Rails.

Cf http://linuxfr.org/suivi/suppression-des-anciens-mots-de-passe-et-nettoyage-des-comptes-obsoletes

Mode d'emploi (à faire dans un screen) :

    bundle install --deployment
    cp config.yml.example config.yml && vim config.yml
    bundle exec ./mailing.rb

♡2012 by Bruno Michel. Copying is an act of love. Please copy and share.

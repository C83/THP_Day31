<h1 align="center">Tests with rails</h1>
<h2 align="center">THP Day 31</h2>


New week, new day, new project. Today, we code a app using test functionality. The used gem is minitest, purposed directly by rails. 

### Process : 
After cloning the repository, 
- Change directory```cd THP_Day31```
- Run gem install ```bundle install --without production```
- Apply mugrations ``` rails db:migrate ```
- Add a .env file ```touch .env``` and reply with a secret_key_base of devise. Ex : ```SECRET_KEY_BASE= 'ab9c10c167aebe4a36482fd226938e3e2cea30a9915ca316d76d47583f9ac2606e72fd5812dff0c1e5a0461319871826cc6cdd96dddf6163c9f24223e6ee4798' ``` 

Then, you can run server or tests :
- For server : ''' rails server```

- For model tests : ```rails test:models```

- For view tests : ```rails test:controllers```


### Status : 

- [X] Model tests

- [X] View tests
  - [X] Il faut tester la page d'accueil, et faire en sorte qu'elle affiche les bons liens, en fonction si la personne est connectée ou non
  - [X]    Ensuite tu vas tester la page d'inscription, qui doit évidemment retourner une erreur si la personne n'a pas rentré les bons champs   (email en double, paramètre manquant)
  - [ ] Il faut tester la page de login, qui doit login la personne si elle rentre un bon ID, et lui renvoyer un message d'erreur si elle ne renvoie pas un bon paramètre
  - [X] Il faut tester la navbar, qui doit afficher les bons liens
  - [X] Il faut tester la page du club, qui ne doit être accessible qu'aux personnes login. La page doit renvoyer la liste des personnes inscrites au site, donc il faut tester cela.

- [X] Une feature
  - [X] Le lien de show doit être accessible de la navbar pour toute personne qui est login (il faut tester ceci). 
  - [X] La page de show doit afficher les informations de l'utilisateur (il faut tester ceci). 
  - [X] Enfin, la page de show ne doit être accessible qu'aux personnes login, et aux personnes concernées. 
  - [X] Si une personne non login essaie d'aller sur une page show, le site va la rediriger vers la page de login en lui disant de se login pour aller à ce contenu (il faut tester ceci). 
  - [X] Aussi, si une personne login essaie d'aller sur un profil autre que le sien, le site va la rediriger vers la page d'accueil en lui disant que l'accés est restreint (il faut tester ceci aussi).

- [X] Une autre feature
  - [X] Code done
  - [ ] Tests redirection 
  - [X] test link on show page

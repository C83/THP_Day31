<h1 align="center">Tests with rails</h1>
<h2 align="center">THP Day 31</h2>


New week, new day, new project. Today, we code a app using test functionality. The used gem is minitest, purposed directly by rails. 

### Process : 
After cloning the repository, you can run tests : 

- For model tests : ```rails test:models```

- For view tests : ```rails test:controllers```


### Status : 

- [X] Model tests
- [ ] View tests
  - [X] Il faut tester la page d'accueil, et faire en sorte qu'elle affiche les bons liens, en fonction si la personne est connectée ou non
  - [X]    Ensuite tu vas tester la page d'inscription, qui doit évidemment retourner une erreur si la personne n'a pas rentré les bons champs   (email en double, paramètre manquant)
  - [ ] Il faut tester la page de login, qui doit login la personne si elle rentre un bon ID, et lui renvoyer un message d'erreur si elle ne renvoie pas un bon paramètre
  - [X] Il faut tester la navbar, qui doit afficher les bons liens
  - [X] Il faut tester la page du club, qui ne doit être accessible qu'aux personnes login. La page doit renvoyer la liste des personnes inscrites au site, donc il faut tester cela.

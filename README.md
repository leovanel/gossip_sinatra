the_gossip_project_sinatra
|
├── config.ru
├── db
│   └── gossip.csv
├── Gemfile
├── Gemfile.lock
├── lib
│   ├── controller.rb
│   ├── gossip.rb
│   └── views
│       ├── edit.erb
│       ├── index.erb
│       ├── new_gossip.erb
│       └── show.erb
└── README.md


création d'un site en se basant sur la gem sinatra !

jusqu'au 2.7, edition de gossip : 
- création de la view edit. erb à laquelle on accede en cliquant sur le lien prévu dans le détail de chaque gossip.7
- Requete POST dans le controller pour appeler la méthode Gossip.update avec les parametres voulu
- méthode Gossip.update qui va modifier la ligne correspondante dans le CSV, et enregistrer un nouveau CSV en place de l'ancien, intégrant les modifications.

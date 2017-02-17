# README

Esta é a minha implementação do desafio de Spotippos. A implementação foi feita utilizando a linguagem Ruby em framework Ruby on Rails

# Install

Para que a aplicação possa ser executada em sua máquina é preciso ter o ruby instalado no ambiente, a versão que foi utilizada nessa implementação foi a 2.3.3. Recomendo fortíssimo o uso do RVM para gestão de versões, caso tenha interesse siga as [instruções de instalação](https://rvm.io/rvm/install).

Uma vez que tiver o ruby instalado no seu ambiente, entre na pasta do projeto e execute os comandos abaixo:

```shell
gem install bundler --no-ri --no-rdoc
bundle install
rake db:create
rake db:migrate
```

É possível fazer a carga dos JSONs de provincias e propriedades (pode demorar um pouco):

```shell
rake db:seed
```

# Running

Para executar o serviço localmente:

```shell
rails s
```

O Host para acesso a API estará executando no endereço `http://localhost/api/v1`:

* GET /properties
* POST /properties
* GET /properties/1

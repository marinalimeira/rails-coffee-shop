# coffee-shop

O projeto contido neste repositório é para gerenciar o estoque de uma loja de cafés, com as seguintes funcionalidades:

- Adicionar um item no estoque;
- Listagem do estoque;
- Atualizar o estoque (uma compra foi realizada, salvamos a compra também);
- Excluir um item do estoque;
- (bônus - se der tempo) Busca de produtos no estoque;
- (bônus - se der tempo) Listagem das vendas;

Com estas funcionalidades, temos um CRUD (Create Read Update Delete), que em SQL é referente as operações Create, Select, Update e Delete e em REST temos o GET, POST, PUT/PATCH e DELETE.

Diagrama do BD:

Coffee
- peso (em gramas)
- tipo de moagem
- tipo do grao
- preço

Compra
- id_cafe
- quantidade
- valor total

## Tutorial

### Ruby

Utilize o [TryRuby.org](http://tryruby.org/) para se familiarizar com a sintaxe do Ruby!

### Rails

Rails é um framework escrito em Ruby. Para isso, precisamos ter o Ruby instalado (para Linux/Mac, eu utilizo o RVM; para Windows, tem o [RailsInstaller]()). Após isso, podemos instalar o Rails:

```
$ gem install rails
```

Dependendo da nossa versão do Ruby, o Rails instalado será v4 ou v5. Existem diferenças consideráveis entre as duas, mas isso não irá afeter a nossa aplicação.
Com a gem do Rails instalada, podemos utilizar os comandos `$ rails <alguma coisa>`. Para criar uma aplicação:

```
$ rails new coffee_shop   --- ISSO TA CERTO??
```

EXECUTAR RAILS SERVER - TEM QUE DAR SUCESSO

Isso irá criar uma pasta com todas as dependências do projeto e irá executar o `bundle install`, esse comando instala todas as *gems* padrões do Rails, que são definidas no arquivo `Gemfile`.

Iremos utilizar as configurações padrões, como SQLite para BD (com isso, não iremos nos preocupar em configurar conexão nem instalar o PostgreSQL) [..]

Para iniciar o desenvolvimento da nossa aplicação, iremos criar os modelos (models) que serão abstrações das tabelas no banco de dados. Assim como visto pela modelagem inicial, teremos duas tabelas:
- coffee e - aaaa


```
$ rails g model coffee aaaa
```

`g` é um (shortcut/alaias)? para `generate`.

Temos vários tipos de dados - MANDAR LINKS DO QUE É EM SQL E O QUE É EM RUBY' - definimos o tipo de cada atributo na criação do modelo.

Obs.: Rails possui muitas configurações que são feitas através de convenções (_Convention Over Configuration_ === CADE LINKS:), por isso iremos construir todos os modelos, controladores etc em inglês, e como o plural em português é bem diferente do jeito que é feito em inglês, as coisas ficariam bem confusas se fizermos em português (e.g. se a gente tiver um modelo "papel" seria criado uma tabela "papels").

A saída desse comando vai ser algo parecido com isso:
```
Running via Spring preloader in process 31198
invoke  active_record
create    db/migrate/20171123121103_create_coffeeers.rb
create    app/models/coffeeer.rb
invoke    test_unit
create      test/models/coffeeer_test.rb
create      test/fixtures/coffeeers.yml
```

Iremos ignorar o que foi criado na pasta `test`, não iremos falar sobre isso (mas testes são essenciais em uma aplicação, então leia sobre isso!). O que nos interessa agora é o que está em  `db/migrate` e o que está em `app/models`.

A migração gerada contem um script do `ActiveRecord` para criar a tabela `coffee` e seus atributos. Esse monte de número no início do arquivo é o _timestamp_ do momento da criação da migração.

O arquivo do modelo só contem a definição da classe. É no modelo que iremos (em alguns instantes) definir os relacionamentos e as validações referentes a entidade d`coffee`.


Ao gerar, vemos que foram criados alguns arquivos:
- mgiration
- model


O outro modelo é o de compra:???????/

```
$ rails g model AAAAA coffee_id:integer
```

Agora que temos os modelos criados e definidos, é possível utilizar o `Rails Console` parar adicionar dados ao banco.

```
$ rails c
```
`c` é ????????? para `console`.

```
> Coffeee.new
> coffeee.create
> Coffee.create(aaa:aaa:aa:)
```

Para construir (agora de verdade) a aplicação, iremos começar pela definição das rotas. Rotas são basicamente as URLs que permitem que a gente acesse diferentes páginas da aplicação.

As rotas são definidas no arquivo `config/routes.rb`. Como já sabemos que queremos fazer um CRUD para `Coffee`, Rails tem um método chamado `resources`, que nos permite gerar rotas para essas ações. (ver arquivo de rotas). Ao gerar os resources para `coffee`, podemos ver quais são as rotas disponíveis no sistema:

```
$ rake routes
```

```
Prefix Verb   URI Pattern                Controller#Action
coffee_index GET    /coffee(.:format)          coffee#index
POST   /coffee(.:format)          coffee#create
new_coffee GET    /coffee/new(.:format)      coffee#new
edit_coffee GET    /coffee/:id/edit(.:format) coffee#edit
coffee GET    /coffee/:id(.:format)      coffee#show
PATCH  /coffee/:id(.:format)      coffee#update
PUT    /coffee/:id(.:format)      coffee#update
DELETE /coffee/:id(.:format)      coffee#destroy
```

Cada linha dessa saída nos indica, respectivamente, qual o método que a gente utiliza para acessar essa rota (e.g. de acordo com a primeira linha, podemos utilizar o método `coffee_index_path` ou `coffee_index_url` para ter ter acesso a URI da listagem de `coffee`), qual o verbo HTTP essa requisição utiliza (mais sobre VERBOS HTTP E ONDE UTILIZAOS, AQUI` e qual ação do controlador é utilizada para executar essa ação, nesse caso, teremos um `CoffeesController` com um método `index` que irá processar essa requisição.


Já que temos uma rota para acessar, podemos testá-la! Ao executar o servidor, tente acessar alguma dessas rotas. Vai dar erro, mas é ok porque ainda não existe um controlador para processar isso (é sempre bom ver dar erro ao invés de já ir fazendo o que você julga estar faltando, vai dar uma ideia melhor do que está acontecendo).


Para gerar um controlador, iremos utilizar um comando o rails:
```
Running via Spring preloader in process 31397
create  app/controllers/coffee_controller.rb
invoke  erb
create    app/views/coffee
invoke  test_unit
create    test/controllers/coffee_controller_test.rb
invoke  helper
create    app/helpers/coffee_helper.rb
invoke    test_unit
create      test/helpers/coffee_helper_test.rb
invoke  assets
invoke    coffee
create      app/assets/javascripts/coffee.js.coffee
invoke    scss
create      app/assets/stylesheets/coffee.css.scss
```

Assim como o gerador de modelos, foram criados muitos arquivos que não iremos utilizar. Uma opção é criar o controlador manualmente (é o que eu - e acho que muita gente - faz no dia-a-dia) ou configurar os geradores para fazer algo mais útil (LINKS).

Iremos (novamente) ignorar os arquivos gerados na pasta `/test`. O conteúdo da pasta `app/assets`, é referente CSS e JS, o padrão do Rails é utilizar CoffeeScript (mas não tenho muita certeza se a comunidade continua utilizando tanto isso) e SASS, por isso vem com esses pré loaders, mas não iremos alterar esses arquivos também. O arquivo gerado em `app/helper` é utilizado para colocarmos logica da _view que não queremos que fique no HTML nem no model (que é onde algumas pessoas acabam colocando).
o
TODOOOOOOOOOOOOOO
MVC: clocar em negrito - todos nomes em ingles

Por hora, iremos mexer no arquivo gerado em `app/controllers` e criaremos arquivos em `app/views/coffee`.

A primeira ação que iremos construir é a de listar. Aproveitaremos os registros criados através do *rails console* para ter alguma coisa para mostrar nessa listagem.

No ' aaa/controlelres/', criaremos um método `index` (igual aquele definido nas rotas) e iremos carregar todos os registros salvos no banco:
```ruby
def index
  @coffees = Coffee.all
end
```

Adicionamos esses registros à uma variável `@coffees`, que possui esse `@` por ser uma variável de instância (LINK PARA VARIAVEL DE INSTANCIA E CLASSE) e ser possível de acessarmos na view.

Por padrão, o Rails irá redirecionar para um arquivo em `app/views/<nome do controller>/<nome da ação>.html.erb`, que no nosso caso é `app/views/coffees/index.html.erb`. A extensão '.erb` é aaaa LINKSo

Basicamente, o que temos na listagem é aaa (ver versao completa)

o
TODO ADICIONAR LA INICIO NO GIT

Criaremos um

(ver resultado final - mandar links)

Para visualizar esses dados, 



































BONUSSSS - UPLOAD DE IMAGEMkkk

















Tudo que fizemos aqui pode ser resumido com um `$ rails generate scaffold`, mas é muita mágica e eu não utilizar isso te ajuda entender melhor como as coisas funcionam :)









































































começaremos pelas rotas. Todas as rotas são definidas no arquivo `config/routes.rb`.


### Outros recursos:

- tutorial rails girls
PERCISO DAR MERGE NO NEGOCIO DO MAUJOR




























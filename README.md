# Como lidar com Concerns no Ruby on Rails

Neste documento você encontrará informações sobre como utilizar Concerns dentro do _Ruby on Rails_, além de encontrar um código de exemplo.
Este código não aborda tópicos como **"quando"** ou **"porque"** utilizar _Concerns_, apenas alguns exemplos de uso.

Informações de uso e boas práticas devem sempre andar de mãos dadas, porém não abrimos mão da seguinte filosofia:

<br />
<blockquote style="font-size: 18pt">
  Primeiro faça funcionar, depois torne-o mais rápido, e então mais elegante.
</blockquote>
<br />

Neste modelo, estamos abordando o **"faça funcionar"**, mas isso não deve te impedir de fazer uma boa leitura nas documentações (onde o endereço da documentação oficial estará disponível em um tópico mais ao final deste documento).

<br />

## Usos mais comum do Concern

Quando um bloco de código se repete muitas vezes, podemos utilizar Concerns para alocar métodos contendo todo código repetitivo.

Além disso, também existem momentos em que um comportamento parece fazer sentido em diferentes lugares. Por exemplo, uma consulta de CPF é um comportamento que faz sentido dentro da entidade **Usuário**, mas também faz sentido dentro da entidade **Compra**.

Sendo assim onde devo colocar a função **"buscar_por_cpf"**? Concerns se fazem uma ótima alternativa neste caso.

Outra ocasião interessante, seria agrupar as _Callbacks_ do _Rails_ quando possível, dentre outras funcionalidades como validações. Vamos imaginar que temos alguns modelos que validam a existência de uma informação (nome por exemplo). Cada um dos nossos _Models_ teria um código como este:

```
validates :name, presence: true
```

Neste caso, como estamos falando de uma unica informação a ser validada, talvez não faça sentido, mas pelo menos mais que uma informação se repetir e necessitar de uma validação, um Concern certamente seria a melhor opção.

<br />

## Considerações Finais

Podemos dizer que Concerns são uma camada alternativa para cumprir determinadas tarefas. Algumas dessas tarefas seriam:

<ul>
  <li>Dividir responsabilidade com outras classes;</li>
  <li>Alocar códigos que façam sentido dentre duas diferentes entidades;</li>
  <li>Alocar Callbacks, e/ou outros comportamentos que possam se repetir</li>
</ul>

Dizem que os Concerns tem como ponto negativo a criação de complexidade desnecessária, e realmente isso pode ser um problema, mas entenda que o maior criador de complexidade desnecessária é a desorganização. Se o seu código for fluido e bem documentado, você provavelmente não terá problemas de complexidade ao utilizar Concerns.

<br />

## Assim como prometido...

Abaixo segue o link para a documentação oficial, e em breve um link para uma postagem do meu blog pessoal falando sobre os Concerns.

<a href="https://api.rubyonrails.org/classes/ActiveSupport/Concern.html">Ruby on Rails Concerns</a>

<br />

## Como testar este Projeto e ver os Concerns na pratica?

Este projeto não possui nenhuma dependência extra ordinária. Provavelmente os procedimentos básicos serão o suficiente para inicializar.

Você só precisa realizar os seguintes passos:

<ul>
  <li>Instalar as dependencias</li>
  <li>Criar, migrar e preencher o banco de dados</li>
  <li>Iniciar o servidor</li>
</ul>

<br />

### Instalando as dependências

Execute o _bundler_ para instalar as dependencias em sua máquina caso você perceba que não possui algumas dessas instaladas.


```
bundle install
```

<br />

### Criando e preenchendo o Banco de Dados

Talvez seja necessário instalar uma biblioteca externa, uma dependência de máquina, pois o projeto faz uso do SQlite.

Basta executar **rails** ou **rake** _tasks_ para seguir com a instalação do banco.

```
rails db:create db:migrate db:seed
```

<br />

### Iniciando o servidor

Por fim, chegou a hora de ver o projeto funcionando. Para isto basta abrir um navegador após a inicialização do servidor.

```
rails server
```

ou

```
rails s
```

Feito isso, em seu navegador, digite:

```
http://localhost:3000/
```

## Interpretando o Projeto

Para entender o que acontece, será necessário observar o nosso arquivo **seeds.rb** disponível no diretório: db/.

Ao observamos este arquivo, vamos perceber que são criados 2 carros (Car), com a cor (Color) "White".

Ao abrir o nosso Concern **Filterable** que se localiza em **controllers/concerns**, vamos observar que existe uma função chamada: **filter_by_color**.

```
def filter_by_color
  Car.where.not(color: 'White')
end
```

Esta função é responsável por filtrar todos os carros pela cor branca.

Este exemplo nos mostra como é possível criar funções que podem ser chamadas em diferentes lugares. Basta fazer o include deste Concern.

Existe também um outro de nome **Validatable**, porém este se localiza em **models/concerns**.

É nítido que ambos trabalham de formas diferentes, pois aqui não temos nenhum comportamento. A unica coisa que temos é uma inclusão que faz a validação da presença de nomes e documentos.

```
included do
  validates :name, :document, presence: true
end
```

Apenas por incluir este Concern a um model, será necessário enviar nomes e documentos no momento de se instanciar esta entidade, do contrário um erro informando a ausência destes deverá aparecer em tela.
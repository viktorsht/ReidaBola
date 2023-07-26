# API Fantasy Game do Campeonato Municipal de Futebol Amador

## Introdução

Este é o README para a API desenvolvida em Laravel para o Fantasy Game do Campeonato Municipal de Futebol Amador.

O FantasyGame prossibilita uma experiência mais interativa e conectada aos torcedores durante o campeonato. Com o Fantasy Game, os participantes podem criar suas próprias equipes virtuais compostas por jogadores reais e competir uns contra os outros com base no desempenho desses jogadores nas partidas reais.

## Contextualização

O Campeonato Municipal de Futebol Amador é um evento anual que movimenta e envolve toda a comunidade. No entanto, o formato atual dos campeonatos municipais ainda não proporciona uma interação plenamente satisfatória entre os torcedores e o certame. A falta de interação digital e recursos interativos tem sido um desafio para engajar a comunidade de torcedores.

## Solução

Para solucionar esse problema, desenvolvemos o Fantasy Game, um jogo virtual que permite aos participantes montarem suas próprias equipes virtuais de futebol com base em jogadores reais. Os participantes selecionam jogadores de diferentes equipes e competem uns contra os outros com base no desempenho real desses jogadores nas partidas reais. 

Os torcedores têm a oportunidade de se envolverem de forma mais ativa com os campeonatos locais, acompanhando estatísticas, desempenho dos jogadores e resultados das partidas. A experiência imersiva e estimulante do Fantasy Game aumenta o engajamento e a emoção durante os jogos.

## Proposta

Ficando nítida a implementação de um fantasy game, por exemplo, para aprimorar a experiência de torcida, permitindo que os fãs montem seus próprios times virtuais e participem de competições paralelas, aumentando o engajamento e a emoção durante os jogos.

Tal adição proporciona aos torcedores uma experiência mais imersiva, estimulante e interativa, contribuindo para uma maior conexão com seus times e jogadores favoritos.

Engajamento aprimorado: oferece aos torcedores a oportunidade de se envolverem de forma mais ativa com os campeonatos locais. Ao montar seus times virtuais, eles se tornam mais engajados e dedicados, acompanhando de perto as estatísticas, desempenho dos jogadores e resultados das partidas.

Aumento da interação entre os torcedores: proporciona uma plataforma interativa onde os torcedores podem competir uns contra os outros. Isso cria uma comunidade engajada de fãs que compartilham sua paixão pelo esporte e pelos times locais, promovendo interações sociais e discussões acaloradas sobre os jogos.

Valorização dos jogadores locais: os jogadores locais ganham mais destaque e reconhecimento. Os torcedores têm a oportunidade de selecionar e acompanhar de perto os atletas de suas equipes favoritas, o que pode aumentar o apoio e a valorização desses jogadores na comunidade.

Ampliação da audiência e visibilidade dos campeonatos: atrai a atenção de uma audiência mais ampla, incluindo torcedores que podem não estar diretamente envolvidos com os campeonatos locais. Isso pode resultar em uma maior visibilidade para as competições, atraindo mais patrocinadores, investimentos e recursos para o desenvolvimento do esporte local.

Estímulo ao acompanhamento integral dos campeonatos: os torcedores são incentivados a acompanhar todas as partidas dos campeonatos locais, não apenas aquelas envolvendo seus times favoritos. Isso contribui para um maior envolvimento com a competição como um todo, fortalecendo a cultura esportiva local.



## Endpoints

### Públicos

- `POST /v1/login`: Realiza login de um usuário
- `POST /v1/register`: Registra um novo usuário

### Protegidos

- `POST /v1/logout`: Realiza logout de um usuário
- `POST /v1/me`: Retorna informações do usuário autenticado
- `POST /v1/refresh`: Atualiza o token de autenticação do usuário

- `GET /v1/accessLevel`: Retorna uma lista de todos os níveis de acesso disponíveis
- `GET /v1/accessLevel/{id}`: Retorna informações do nível de acesso especificado pelo ID

- `GET /v1/state`: Retorna uma lista de todos os estados disponíveis
- `GET /v1/state/{id}`: Retorna informações do estado especificado pelo ID

- `GET /v1/city`: Retorna uma lista de todas as cidades disponíveis
- `GET /v1/city/{id}`: Retorna informações de cidade especificado pelo ID
- `GET /v1/stadium`: Retorna uma lista de todos os estádios disponíveis
- `GET /v1/stadium/{id}`: Retorna informações do estádio especificado pelo ID

- `GET /v1/championship`: Retorna uma lista de todos os campeonatos disponíveis
- `GET /v1/championship/{id}`: Retorna informações do campeonato especificado pelo ID

- `GET /v1/coach`: Retorna uma lista de todos os técnicos disponíveis
- `GET /v1/coach/{id}`: Retorna informações do técnico especificado pelo ID

- `GET /v1/positionPlayer`: Retorna uma lista de todas as posições de jogadores disponíveis
- `GET /v1/positionPlayer/{id}`: Retorna informações da posição de jogador especificada pelo ID

- `GET /v1/player`: Retorna uma lista de todos os jogadores disponíveis
- `GET /v1/player/{id}`: Retorna informações do jogador especificado pelo ID

- `GET /v1/team`: Retorna uma lista de todas as equipes disponíveis
- `GET /v1/team/{id}`: Retorna informações da equipe especificada pelo ID

- `GET /v1/teamEdition`: Retorna uma lista de todas as edições de equipes disponíveis
- `GET /v1/teamEdition/{id}`: Retorna informações da edição de equipe especificada pelo ID

- `GET /v1/playerEdition`: Retorna uma lista de todas as edições de jogadores disponíveis
- `GET /v1/playerEdition/{id}`: Retorna informações da edição de jogador especificada pelo ID

- `GET /v1/statusLineup`: Retorna uma lista de todos os status de escalação disponíveis
- `GET /v1/statusLineup/{id}`: Retorna informações do status de escalação especificado pelo ID

- `GET /v1/championshipRound`: Retorna uma lista de todas as rodadas de campeonato disponíveis
- `GET /v1/championshipRound/{id}`: Retorna informações da rodada de campeonato especificada pelo ID

- `GET /v1/soccerMatch`: Retorna uma lista de todas as partidas de futebol disponíveis
- `GET /v1/soccerMatch/{id}`: Retorna informações da partida de futebol especificada pelo ID

- `GET /v1/matchLineup`: Retorna uma lista de todas as escalações de partidas disponíveis
- `GET /v1/matchLineup/{id}`: Retorna informações da escalação de partida especificada pelo ID

- `GET /v1/substitution`: Retorna uma lista de todas as substituições disponíveis
- `GET /v1/substitution/{id}`: Retorna informações da substituição especificada pelo ID

- `GET /v1/teamGame`: Retorna uma lista de todos os times do jogo disponíveis
- `POST /v1/teamGame`: Cria um novo time do jogo
- `POST /v1/teamGame/{id}`: Atualiza o time do jogo especificado pelo ID

- `GET /v1/teamGameEdition`: Retorna uma lista de todas as edições de times do jogo disponíveis
- `POST /v1/teamGameEdition`: Cria uma nova edição de time do jogo
- `POST /v1/teamGameEdition/{id}`: Atualiza a edição de time do jogo especificada pelo ID

- `GET /v1/matchGameLineup`: Retorna uma lista de todas as escalações de partidas do jogo disponíveis
- `POST /v1/matchGameLineup`: Cria uma nova escalação de partida do jogo
- `POST /v1/matchGameLineup/{id}`: Atualiza a escalação de partida do jogo especificada pelo ID
- `DELETE /v1/matchGameLineup/{id}`: Exclui a escalação de partida do jogo especificada pelo ID






### Apenas para usuários com nível de acesso 1

- `POST /v1/accessLevel`: Cria um novo nível de acesso
- `POST /v1/accessLevel/{id}`: Atualiza o nível de acesso especificado pelo ID
- `DELETE /v1/accessLevel/{id}`: Exclui o nível de acesso especificado pelo ID

- `POST /v1/state`: Cria um novo estado
- `POST /v1/state/{id}`: Atualiza o estado especificado pelo ID
- `DELETE /v1/state/{id}`: Exclui o estado especificado pelo ID

- `POST /v1/city`: Cria uma nova cidade
- `POST /v1/city/{id}`: Atualiza a cidade especificada pelo ID
- `DELETE /v1/city/{id}`: Exclui a cidade especificada pelo ID

- `POST /v1/stadium`: Cria um novo estádio
- `POST /v1/stadium/{id}`: Atualiza o estádio especificado pelo ID
- `DELETE /v1/stadium/{id}`: Exclui o estádio especificado pelo ID

- `POST /v1/championship`: Cria um novo campeonato
- `POST /v1/championship/{id}`: Atualiza o campeonato especificado pelo ID
- `DELETE /v1/championship/{id}`: Exclui o campeonato especificado pelo ID

- `POST /v1/coach`: Cria um novo técnico
- `POST /v1/coach/{id}`: Atualiza o técnico especificado pelo ID
- `DELETE /v1/coach/{id}`: Exclui o técnico especificado pelo ID

- `POST /v1/positionPlayer`: Cria uma nova posição de jogador
- `POST /v1/positionPlayer/{id}`: Atualiza a posição de jogador especificada pelo ID
- `DELETE /v1/positionPlayer/{id}`: Exclui a posição de jogador especificada pelo ID

- `POST /v1/player`: Cria um novo jogador
- `POST /v1/player/{id}`: Atualiza o jogador especificado pelo ID
- `DELETE /v1/player/{id}`: Exclui o jogador especificado pelo ID

- `POST /v1/team`: Cria uma nova equipe
- `POST /v1/team/{id}`: Atualiza a equipe especificada pelo ID

- `POST /v1/championshipRound`: Cria uma nova rodada de campeonato
- `POST /v1/championshipRound/{id}`: Atualiza a rodada de campeonato especificada pelo ID
- `DELETE /v1/championshipRound/{id}`: Exclui a rodada de campeonato especificada pelo ID

- `POST /v1/soccerMatch`: Cria uma nova partida de futebol
- `POST /v1/soccerMatch/{id}`: Atualiza a partida de futebol especificada pelo ID
- `DELETE /v1/soccerMatch/{id}`: Exclui a partida de futebol especificada pelo ID

- `POST /v1/matchLineup`: Cria uma nova escalação de partida
- `POST /v1/matchLineup/{id}`: Atualiza a escalação de partida especificada pelo ID
- `DELETE /v1/matchLineup/{id}`: Exclui a escalação de partida especificada pelo ID

- `POST /v1/substitution`: Cria uma nova substituição
- `POST /v1/substitution/{id}`: Atualiza a substituição especificada pelo ID
- `DELETE /v1/substitution/{id}`: Exclui a substituição especificada pelo ID

- `DELETE /v1/teamGame/{id}`: Exclui o time do jogo especificado pelo ID

- `DELETE /v1/teamGameEdition/{id}`: Exclui a edição de time do jogo especificada pelo ID


## Tecnologias Utilizadas

- Laravel: Framework PHP para desenvolvimento web.
- MySQL: Banco de dados relacional.
- Composer: Gerenciador de dependências do PHP.
- Postman: Ferramenta para testar as chamadas da API.
- Git: Sistema de controle de versão para o desenvolvimento colaborativo.


## Instalação e Execução

1. Clone o repositório do projeto.

2. Instale as dependências do projeto usando o Composer: composer install

3. Configure o arquivo `.env` com as informações do banco de dados e outras configurações necessárias.

4. Gere a chave de criptografia do aplicativo: php artisan key:generate

5. Execute as migrações para criar as tabelas do banco de dados: php artisan migrate

6. Inicie o servidor de desenvolvimento: php artisan serve

7. A API estará acessível em `http://localhost:8000`.

<!-- ## Uso da API

A documentação completa da API Fantasy Game está disponível em [URL_DA_API/docs](URL_DA_API/docs). -->

## Autores

- Humberto Júnior (1berto_junior) - [GitHub](https://github.com/1bertojunior)

## Suporte e Contribuições

Se você encontrar problemas ou tiver sugestões para melhorias, sinta-se à vontade para abrir uma issue ou enviar um pull request no repositório do projeto.





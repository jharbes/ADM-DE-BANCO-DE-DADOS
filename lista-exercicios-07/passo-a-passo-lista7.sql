/*

Primeiro, vamos criar uma rede Docker para que os contêineres possam se comunicar entre si. Execute o seguinte comando em seu terminal:

docker network create my-network

 Criar e levantar os contêineres MySQL
Agora, vamos criar e levantar os contêineres para os três bancos de dados MySQL. Execute os seguintes comandos:

docker run -d --name=db1 --network=my-network -e MYSQL_ROOT_PASSWORD=my-secret-pw -e MYSQL_DATABASE=db1 mysql


docker run -d --name=db2 --network=my-network -e MYSQL_ROOT_PASSWORD=my-secret-pw -e MYSQL_DATABASE=db2 mysql


docker run -d --name=db3 --network=my-network -e MYSQL_ROOT_PASSWORD=my-secret-pw -e MYSQL_DATABASE=db3 mysql

Esses comandos criam três contêineres MySQL separados, cada um com um nome exclusivo (db1, db2, db3) e um banco de dados diferente (db1, db2, db3). Certifique-se de substituir "my-secret-pw" por uma senha forte de sua escolha.


Passo 4: Verificar os contêineres em execução
Você pode verificar se os contêineres estão em execução usando o seguinte comando:

docker ps

Você deve ver os três contêineres MySQL em execução, cada um com seu respectivo nome (db1, db2, db3).



asso 5: Conectar-se aos bancos de dados
Agora que os contêineres estão em execução, você pode se conectar a cada banco de dados individualmente usando um cliente MySQL ou ferramenta de sua escolha, como o MySQL Workbench. Para se conectar, você pode usar o IP do contêiner MySQL e a porta padrão do MySQL (3306).

Por exemplo, para se conectar ao "db1", você pode usar o seguinte comando no terminal:

mysql -h <IP do Contêiner db1> -P 3306 -u root -p

Lembre-se de substituir "<IP do Contêiner db1>" pelo endereço IP real do contêiner "db1" (você pode obtê-lo usando o comando docker inspect db1 | grep IPAddress).

Repita o mesmo processo para os bancos de dados "db2" e "db3".

Agora você tem três bancos de dados MySQL independentes em execução como contêineres Docker separados, cada um em sua própria rede isolada. Você pode acessar e gerenciar cada banco de dados individualmente usando as ferramentas de banco de dados apropriadas.

*/
# Linux - Gerenciamento de Usuários

Em qualquer sistema operacional multiusuário, gerenciar usuários e grupos é um conceito fundamental. Quando um processo é executado, ele o faz como o usuário que o iniciou. Da mesma forma, o acesso a arquivos e a propriedade dependem de permissões, impedindo que um usuário acesse os documentos privados de outro. 

De forma geral, cada usuário em um sistema Linux recebe um diretório pessoal, geralmente localizado em `/home/username`. Este diretório é onde seus arquivos e configurações específicos do usuário são armazenados, embora o caminho exato possa variar entre as distribuições Linux.

O sistema identifica usuários com um ID de Usuário (`UID`) e grupos com um ID de Grupo (`GID`). Embora usemos nomes de usuário legíveis por humanos, o sistema operacional depende desses IDs numéricos exclusivos para todas as tarefas relacionadas a permissões. Grupos são simplesmente coleções de usuários, facilitando o gerenciamento de permissões para várias contas de uma só vez.

Dentre todos os usuários e grupos que podemos ter dentro de uma máquina, um deles se destaca por ter acesso privilegiado a todas as informações dentro do computador. O usuário **Root**, um usuário que tem privilégios de administrador dentro do sistema operacional

---

# /etc/passwd

No Linux, nomes de usuário são rótulos legíveis por humanos, mas o sistema identifica os usuários com um ID de Usuário (UID) exclusivo. O mapeamento entre nomes de usuário e UIDs é armazenado no arquivo `/etc/passwd`, um componente crítico para o gerenciamento de usuários.

Para visualizar seu conteúdo, você pode usar um comando simples:

```bash
cat /etc/passwd
```

Este arquivo exibe uma lista de todos os usuários do sistema e informações detalhadas sobre eles. Cada linha representa uma única conta de usuário.

### Desmembrando os Campos do /etc/passwd

A linha típica neste arquivo, muitas vezes a primeira, se parece com isto:

```plaintext
root:x:0:0:root:/root:/bin/bash
```

Esta entrada para o usuário `root` contém sete campos separados por dois pontos (`:`). Entender a estrutura do `/etc/passwd` no Linux é fundamental para gerenciar usuários. Vamos detalhar cada campo:

1. **Nome de Usuário**: O nome de login do usuário (ex: `root`).
2. **Senha**: Um espaço reservado para a senha criptografada do usuário. A senha real não é armazenada aqui por razões de segurança.
   - Um `x` indica que a senha criptografada está no arquivo `/etc/shadow`.
   - Um `*` (asterisco) significa que a conta está bloqueada e não pode ser usada para login.
   - Um campo em branco significa que o usuário não tem senha.
3. **ID de Usuário (UID)**: O identificador numérico exclusivo para o usuário. O usuário `root` sempre tem um UID de `0`.
4. **ID do Grupo (GID)**: O identificador numérico para o grupo primário do usuário.
5. **Campo GECOS**: Um campo de comentário que tradicionalmente contém informações extras como o nome completo do usuário, número de telefone ou localização do escritório. É delimitado por vírgulas.
6. **Diretório Home**: O caminho absoluto para o diretório home do usuário (ex: `/root`).
7. **Shell Padrão**: O interpretador de linha de comando padrão do usuário, que é executado no login (ex: `/bin/bash`).

### Usuários do Sistema e Contas Especiais

Ao inspecionar o arquivo `/etc/passwd`, você notará muitas contas que não pertencem a usuários humanos. Estas são contas de sistema usadas para executar serviços ou processos específicos com permissões limitadas, aumentando a segurança do sistema. Por exemplo, o usuário `daemon` é usado para executar processos em segundo plano (daemons).

### Editando o Arquivo /etc/passwd

Embora tecnicamente você possa editar o arquivo `/etc/passwd` diretamente usando um editor de texto ou o comando `vipw`, isso é fortemente desencorajado. Edições manuais podem facilmente introduzir erros de sintaxe, potencialmente bloqueando seu acesso ao sistema ou causando instabilidade.

É sempre mais seguro e confiável usar utilitários de linha de comando dedicados como `useradd`, `usermod` e `userdel` para gerenciar contas de usuário. Essas ferramentas são projetadas para modificar o arquivo corretamente e lidar com todas as configurações relacionadas.

---

# /etc/shadow

O arquivo `/etc/shadow` é usado para armazenar informações sobre a autenticação do usuário. Ele requer permissões de leitura de superusuário.

```bash
$ sudo cat /etc/shadow

root:MyEPTEa$6Nonsense:15000:0:99999:7:::
```

Você notará que ele se parece muito com o conteúdo de `/etc/passwd`; no entanto, no campo da senha, você verá uma senha criptografada. Os campos são separados por dois pontos, da seguinte forma:

1. Nome de usuário
2. Senha criptografada
3. Data da última alteração de senha - expressa como o número de dias desde 1º de janeiro de 1970. Se houver um 0, isso significa que o usuário deve alterar sua senha na próxima vez que fizer login.
4. Idade mínima da senha - Dias que um usuário terá que esperar antes de poder alterar sua senha novamente.
5. Idade máxima da senha - Número máximo de dias antes que um usuário tenha que alterar sua senha.
6. Período de aviso de senha - Número de dias antes que uma senha expire.
7. Período de inatividade da senha - Número de dias após a expiração de uma senha para permitir o login com sua senha.
8. Data de expiração da conta - Data em que um usuário não poderá fazer login.
9. Campo reservado para uso futuro.

Na maioria das distribuições atuais, a autenticação do usuário não depende apenas do arquivo `/etc/shadow`; existem outros mecanismos em vigor, como PAM (Pluggable Authentication Modules), que substituem a autenticação.

---

# /etc/group

No Linux, o gerenciamento de permissões para múltiplos usuários é simplificado através do uso de grupos. O arquivo central para isso é o `/etc/group`, que define os grupos no sistema e seus membros.

### O que é o arquivo /etc/group?

O arquivo `/etc/group` no Linux é um arquivo de texto simples que contém a lista de todos os grupos de usuários. Cada grupo pode receber permissões específicas para arquivos e diretórios, permitindo que os administradores gerenciem os direitos de acesso de forma eficiente para vários usuários de uma só vez. Entender este arquivo é crucial para o gerenciamento adequado de usuários e permissões em qualquer ambiente `etc group linux`.

### Visualizando Informações de Grupo

Para inspecionar o conteúdo deste arquivo, você pode usar um comando simples. Executar `cat /etc/group` no seu terminal exibirá todas as definições de grupo no seu sistema.

```bash
$ cat /etc/group

root:*:0:pete
```

### Estrutura do Arquivo /etc/group

Semelhante ao arquivo `/etc/passwd`, cada linha no arquivo `/etc/group` representa um único grupo e contém quatro campos separados por dois pontos (`:`).

1. **Nome do Grupo**: O nome exclusivo do grupo.
2. **Senha do Grupo**: Este campo é um recurso legado e raramente é usado. Sistemas modernos usam ferramentas como `sudo` para privilégios elevados em vez de senhas de grupo. Você normalmente verá um espaço reservado como um asterisco (`*`) ou um 'x'.
3. **ID do Grupo (GID)**: Um identificador numérico exclusivo para o grupo. O sistema frequentemente usa o GID internamente em vez do nome do grupo.
4. **Lista de Usuários**: Uma lista separada por vírgulas de nomes de usuário que são membros deste grupo.

No exemplo `root:*:0:pete`, o nome do grupo é `root`, não há senha, o GID é `0` e o usuário `pete` é um membro.
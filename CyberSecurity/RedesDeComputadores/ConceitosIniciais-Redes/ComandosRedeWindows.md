# Comando de Rede CMD

**tracert <url> [parametros]**

- Mostra a rota de rede até o URL especificado

**pathping <ip> [parametros]**

- Junção entre o ping e o tracert

**nslookup <URL/IP>**

- Exibe informações a respeito do DNS de um servidor

**netsh interface ip show config**

- Mostra os detalhes a respeito de um IP

**route**

- a

netstat -an

- Mostra as portas ativas

---

Mostrando redes que já foram conectadas

- netsh wlan show profiles

Mostrando a senha de uma rede que já está conectada

- netsh wlan show profiles name= "re" key= clear

---

netsh trace start capture=yes

- Capturando pacotes dentro de uma rede

---

> [Microsoft Learn](https://learn.microsoft.com/pt-br/windows-server/administration/windows-commands/nslookup)
> 

Gerenciamento de rede
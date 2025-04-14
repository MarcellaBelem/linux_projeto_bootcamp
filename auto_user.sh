#!/bin/bash

#fazer um script automatizando criação de usuarios, diretórios e permissões

#diretorios: publico(777), adm, ven, sec
#cada grp tem permissão total, mas os outros fora do grupo não podem nem acessar 770
#GRP_ADM : carlos, maria e joao
#GRP_VEN: debora, sebastiana e roberto
#GRP_SEC: josefina, amanda e rogerio

#criar os grupos
echo "Criando os grupos"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# criar os usuarios
echo "Adicionando os usuarios"
useradd carlos -m -c "Carlos admistracao" -s /bin/bash -p $(opessl passwd -crypt adm123) -G GRP_ADM
useradd maria -m -c "Maria admistracao" -s /bin/bash -p $(opessl passwd -crypt adm123) -G GRP_ADM
useradd joao -m -c "Joao admistracao" -s /bin/bash -p $(opessl passwd -crypt adm123) -G GRP_ADM


useradd debora -m -c "Debora vendas" -s /bin/bash -p $(opessl passwd -crypt vendas123) -G GRP_VEN
useradd sebastiana -m -c "Sebastiana vendas" -s /bin/bash -p $(opessl passwd -crypt vendas123) -G GRP_VEN
useradd roberto -m -c "Roberto vendas" -s /bin/bash -p $(opessl passwd -crypt vendas123) -G GRP_VEN

useradd josefina -m -c "Josefina secretariado" -s /bin/bash -p $(opessl passwd -crypt sec123) -G GRP_SEC
useradd amanda -m -c "Amanda secretariado" -s /bin/bash -p $(opessl passwd -crypt sec123) -G GRP_SEC
useradd rogerio -m -c "Rogerio secretariado" -s /bin/bash -p $(opessl passwd -crypt sec123) -G GRP_SEC


#criar as pastas
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

#modificando permissões
echo "configurando as permissoes"
#permissão para o diretorio publico
chmod 777 /publico

#especificando o dono e o grupo
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

#permissoes individuais para cada grupo
#root como dono, grupo tendo W,R e X, outros 0
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "configuração de usuarios concluida com sucesso"

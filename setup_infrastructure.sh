#!/bin/bash

# Definindo variáveis
USERS=("user1" "user2" "user3")
GROUPS=("group1" "group2")
DIRS=("/home/user1" "/home/user2" "/home/user3")

# Criando grupos
for GROUP in "${GROUPS[@]}"; do
    groupadd $GROUP
done

# Criando usuários e adicionando aos grupos
for USER in "${USERS[@]}"; do
    useradd -m -s /bin/bash $USER
    usermod -aG ${GROUPS[0]} $USER  # Adicionando ao primeiro grupo como exemplo
done

# Criando diretórios e atribuindo permissões
for DIR in "${DIRS[@]}"; do
    mkdir -p $DIR
    chown root:root $DIR
    chmod 755 $DIR
done

# Definindo permissões específicas para usuários e grupos
chmod 770 /home/user1
chown user1:group1 /home/user1

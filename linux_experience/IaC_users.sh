#!/usr/bin/bash

# ===================================================
#        Criando os diretórios
# ===================================================
dir_names=("publico" "adm" "ven" "sec")

dir_permissions=(777 770 770 770)

for i in "${!dir_names[@]}"; do

	dir="${dir_names[$i]}"
	
	perm="${dir_permissions[$i]}"
	
    mkdir /"$dir"
    
    chmod $perm /"$dir"
    
    echo "Diretorio /$dir criado com permissao $perm."
done

 
# ===================================================
#        Criando os grupos
# ===================================================

groups=("GRP_ADM" "GRP_VEN" "GRP_SEC")

for i in "${!groups[@]}"; do
	
	group="${groups[$i]}"
	
	dir="${dir_names[`expr $i + 1`]}"

	groupadd ${groups[$i]}
	
	chown root:$group /$dir
	
	echo "Grupo $group criado."
done
	
# ===================================================
# 	Criando os usuarios e atribuindo-os aos seus 
# 	respectivos grupos
# ===================================================

adm_users=("carlos" "maria" "joao")
ven_users=("debora" "sebastiana" "roberto")
sec_users=("josefina" "amanda" "rogerio")

add_users () {
	group=("$1")
	users=("$@")
	for user in "${users[@]:1}"; do
		useradd "$user" -G "$group" -m -s /bin/bash -p "$(openssl passwd -crypt 1234)"
		passwd "$user" -e
		
		echo "Usuario $user associado ao grupo $group criado."
	done
}


add_users "GRP_ADM" "${adm_users[@]}"

add_users "GRP_VEN" "${ven_users[@]}"

add_users "GRP_SEC" "${sec_users[@]}"


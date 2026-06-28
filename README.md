# TP_AySO_Integral_FAndres
Nombre y Apellido: Andres Frias - Legajo: 120586

## Grupo FAndres

## Materia
Arquitectura y Sistemas Operativos  
Tecnicatura Universitaria en Programación - UTN FRA

## Datos del Grupo
- **Nombre del Grupo:** FAndres
- **División:** 313
- **Turno:** Noche

## Integrantes

|   Rol   | Nombre | Apellido |
|---------|--------|----------|
| R1 - R6 | Andres |   Frias  | 

## Estructura del Repositorio
```sh
.
├── Bash_script/
│   ├── alta_usuarios/
│   │   ├── alta_usuarios.sh          # Script de alta de usuarios
│   │   └── Lista_Usuarios.txt        # Lista de usuarios a crear
│   └── check_url/
│       ├── check_URL.sh              # Script de chequeo de URLs
│       └── Lista_URL.txt             # Lista de URLs a chequear
├── ansible/
│   ├── ansible.cfg                   # Configuración de Ansible
│   ├── playbook.yml                  # Playbook principal
│   ├── inventory/
│   │   └── hosts                     # Inventario de VMs
│   └── roles/
│       ├── TP_INI/                   # Crea archivo de datos del grupo
│       ├── Alta_Usuarios_ASANCHEZ/   # Crea usuarios y grupos
│       ├── Sudoers_ASANCHEZ/         # Configura sudo sin password
│       └── Instala-tools_ASANCHEZ/   # Instala htop, tmux y speedtest-cli
├── VagrantFile/
│   └── Vagrantfile                   # Configuración de las VMs
├── LVM/
│   └── lvm_setup.sh                  # Configuración de LVM
└── integrantes.txt                   # Lista de integrantes
```

## Infraestructura (R2)

2 VMs con QEMU (Apple Silicon):
- **VM1-Grupo-FAndres** - Ubuntu 22.04 ARM64 (Testing)
- **VM2-Grupo-FAndres** - Fedora (Producción)

### Discos y LVM

| VG       | LV           | Tamaño | Punto de Montaje |
|----------|--------------|--------|------------------|
| vg_datos | lv_docker    | 10M    | /var/lib/docker  |
| vg_datos | lv_workareas | 2.5GB  | /work            |
| vg_temp  | lv_swap      | 1.9GB  | SWAP             |

## Bash Scripting (R3)

### Alta de Usuarios
Crea usuarios y grupos en el sistema a partir de una lista:
\`\`\`bash
sudo bash Bash_Script/alta_usuarios/alta_usuarios.sh
\`\`\`

### Chequeo de URLs
Verifica si una lista de URLs están online:
\`\`\`bash
sudo bash Bash_Script/check_url/check_URL.sh
\`\`\`

## Ansible (R4)

Ejecutar el playbook desde VM1:
\`\`\`bash
cd Ansible/
ansible-playbook -i inventory/hosts playbook.yml
\`\`\`

### Roles
- **TP_INI** - Crea `/tmp/Grupo/datos.txt` con info del grupo
- **Alta_Usuarios_Andres_Frias** - Crea usuarios y grupos en ambas VMs
- **Sudoers_Andres_Frias** - Configura sudo sin password para el grupo
- **Instala-tools_Andres_Frias** - Instala htop, tmux y speedtest-cli

### docker (R5)

crear imagen:
\`\`\`bash
cd Docker/
bash script_crear_imagen.sh
\`\`\`

para correr ejecute desde la misma carpeta Docker:
\`\`\`bash
docker compose up -d
\`\`\`

abrir el navegador y colocar:
http://192.168.56.10:8081/
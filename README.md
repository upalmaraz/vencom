# vencom

# Instrucciones

## Crear imagen con Packer
```sh
packer build samba.json 
```

## Aprovisionamiento en Terraform
```sh
terraform [plan|apply|destroy]
```

## Aprovisionamiento general
```sh
ansible-playbook -i production samba.yml
```

## Desplegar la config solo de samba (u otro tag)
```sh
ansible-playbook -i production samba.yml --tags "samba" 
```

## Acceso y despliegue
### Requesitos
* Tacoma Versión 1.0.12 o superior [Github](https://github.com/pantulis/tacoma)
* Ansible Versión 2.5.0 o superior [Ansible](http://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html?)
* Packer Versión 1.2.1 o superior [Packer](https://www.packer.io/docs/install/index.html#compiling-from-source)
* Terraform Versión 0.11.3 o superior [Terraform](https://www.terraform.io/intro/getting-started/install.html)

### Configurar tacoma

En tu local debe haber un archivo con el nombre `.tacoma.yml` en el cual vamos a configurar nuestro acceso a aws con ello al servidor.
```sh
 project:
   aws_identity_file: "/path/to/pem/file/my_project.pem"
   aws_secret_access_key: "YOURSECRETACCESSKEY"
   aws_access_key_id: "YOURACCESSKEYID"
   region: "REGION"
   repo: "$HOME/projects/my_project"
``` 

Para ingresar al proyecto solo ejecuta
```sh
tacoma switch project
```

### Acceso al servidor
El ingreso al servidor seria a traves de `ssh`
```sh
$ ssh operator@1.1.1.2 
```

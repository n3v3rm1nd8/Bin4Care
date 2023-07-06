# Información previa

- Herramienta para saber que binarios o capabilities tipicas tienes en tu sistema Linux para tener cuidado a la hora de asignarles permisos privilegiados.
- Esta utilidad solo se puede ejecutar desde la propia maquina donde quieras examinar los binarios.
- La finalidad de esta herramienta es que los administradores tengan mejor control de los tipicos binarios que pocas veces se suele dar importancia, por lo que es recomendable que el script se ejecute como root para tener acceso a los maximos binarios posibles.
- Si alguien quiere modificar el script a su gusto es totalmente libre.
- En el output que refleja el script, al lado del binario sale el enlace para ver como se podria explotar dicho binario.

## Uso
Primero nos clonamos el repositorio:

`$ sudo git clone https://github.com/n3v3rm1nd8/Bin4Care`

Le damos permisos de ejecucion a ambos scripts:

`$ sudo chmod +x SETUP.sh; chmod +x bin4care.sh`

Nos descargamos las dependencias en el caso de que no las tengamos:

`$ sudo ./SETUP.sh`

Hecho esto, ya podemos usar el script:

`$ sudo ./bitmap.sh`

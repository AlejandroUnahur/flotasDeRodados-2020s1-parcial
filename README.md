# Flotas de rodados
 
[![Build Status](https://travis-ci.org/wollok/flotasDeRodados.svg?branch=master)](https://travis-ci.org/wollok/flotasDeRodados)


En este ejercicio vamos a construir un modelo que pueda servir para la administración de las flotas de rodados que utilizan las distintas dependencias de la Municipalidad de Coronel Vallejos. 

## Etapa 1 - Rodados y dependencias

De cada **rodado** nos van a interesar: _capacidad_ (o sea, cuántos pasajeros puede transportar), _velocidad máxima_, _color_ y _peso_.

A continuación se describen los rodados que maneja la muncipalidad.

- Varios **Chevrolet Corsa**. <br>
  La capacidad de estos autos es de 4 pasajeros, su velocidad máxima 150 km/h, y pesan 1300 kg. <br>
  La municipalidad no estableció un color fijo para sus Corsa; por lo tanto, debe informarse el color de cada uno. <br>

- Varios **Renault Kwid** que funcionan _a gas_. 
  Cada uno de ellos puede tener puesto, o no, un tanque adicional. 
  - La capacidad de un Kwid es de 4 pasajeros si no tiene puesto el tanque adicional, o 3 pasajeros si sí lo tiene puesto.
  - La velocidad máxima es 120 km/h con, o 110 km/h sin, tanque adicional.
  - El peso es 1200 kg, más 150 kg adicionales si tiene tanque adicional. 
  - Todos los autos de este tipo con que cuenta la municipalidad son azules. <br>

- **Una Trafic** (sí, una sola), que es reconfigurable, porque se le puede cambiar el interior y el motor.
  - La municipalidad cuenta con dos _interiores_, uno **cómodo** (capacidad 5 pasajeros, peso 700 kg) y otro **popular** (capacidad 12 pasajeros, peso 1000 kg). La municipalidad tiene un solo interior de cada tipo.
  - También ha comprado dos _motores_ para su Trafic, uno **pulenta** (que pesa 800 kg y permite una velocidad máxima de 130 km/h) y otro **batatón** (que pesa 500 kg y permite una velocidad máxima de 80 km/h). La municipalidad tiene un solo motor de cada tipo.
  - Varias características de la Trafic dependen de qué interior y qué motor le hayan puesto:
    - La _capacidad_ de la Trafic es la del interior.
    - La _velocidad máxima_ es la que permite el motor.
    - El peso es 4000 kg más el peso del interior más el del motor.
  - Finalmente, digamos que la Trafic es de _color blanco_, independientemente del interior y el motor que tenga puestos. 
  
- Varios **autos especiales** que son todos distintos entre sí. De cada uno de ellos se debe especificar capacidad, velocidad máxima, peso y color.

<br>

Como dijimos, cada **dependencia** de la municipalidad maneja una _flota de rodados_. Un rodado puede estar compartido entre varias dependencias (ver test más abajo). 
De cada dependencia importa también _cuántos empleados tiene_.
 
Debe ser posible enviarle los siguientes mensajes a cada objeto que representa a una dependencia.
- `agregarAFlota(rodado)` y `quitarDeFlota(rodado)`.
- `pesoTotalFlota()`, la suma del peso de cada rodado afectado a la flota.
- `estaBienEquipada()`, es verdadero si la flota tiene al menos 3 rodados, y además, _todos_ los rodados de la flota pueden ir al menos a 100 km/h.
- `capacidadTotalEnColor(color)`, la cantidad total de personas que puede transportar la flota afectada a la dependencia, considerando solamente los rodados del color indicado.
- `colorDelRodadoMasRapido()`, eso.
- `capacidadFaltante()`, que es el resultado de restar, de la cantidad de empleados, la capacidad sumada de los vehículos de la flota. 
- `esGrande()`, la condición es que la dependencia tenga al menos 40 empleados y 5 rodados.


### Test con dos dependencias

Armar un test en el que hay que se definen dos dependencias: deportes (45 empleados) y cultura (31 empleados).
	
En este test debe definirse un rodado al que llamaremos _cachito_; o sea, definir `var cachito = ...`.
Este rodado debe ser un Corsa de color rojo.
	
La flota de deportes incluye a: `cachito`, un Corsa azul, un Corsa verde, un Kwid con el tanque adicional puesto; y un auto especial con estas características: capacidad 5 pasajeros, velocidad máxima 160 km/h, peso 1200 kg, color beige.
	
Por su parte, cultura cuenta con: `cachito`; dos Kwid con el tanque adicional puesto; un Kwid más, este sin el tanque adicional;  y la Trafic, configurada con el interior popular y el motor batatón.
	
Notar que `cachito` forma parte de la flota de _ambas_ dependencias.

Para cada dependencia, hacer asserts sobre: el peso total de la flota, si está o no bien equipada, la capacidad total en color azul, el color del rodado más rápido, si es grande o no, y la capacidad faltante. 

Va una ayudita: la capacidad faltante de deportes es de 25 personas (la flota puede llevar: 12 personas en los 3 Corsa, más 3 del Kwid y 5 del auto especial; total 20), mientras que la de cultura es de 5 personas (puede llevar en total 26: 6 de los Kwid con tanque adicional, más 4 de la Kwid sin tanque, más 4 de cachito, más 12 de la Trafic dado que tiene el interior popular).	

<br/>


## Etapa 2: modelo de pedidos

Agregar al modelo los **pedidos** de translados que se generan en la municipalidad.  
Cada pedido especifica: la _distancia_ a recorrer (expresada en kilómetros), el _tiempo máximo_ en que se puede hacer el viaje (expresado en horas), la _cantidad de pasajeros_ a transportar, y también un conjunto de _colores incompatibles_, o sea, que los pasajeros rechazan hacer el viaje en autos de esos colores.  
La _velocidad requerida_ de un pedido es el resultado de dividir la cantidad de kilómetros por el tiempo máximo.
P.ej. si para un pedido de un viaje de 480 kilómetros se indica como tiempo máximo 6 horas, entonces la velocidad requerida de este pedido es de 80 kms/hora (480 / 6 = 80).   
	
Agregar la capacidad de preguntar _si un auto puede satisfacer un pedido_, enviándole un mensaje al viaje con el auto como parámetro. 

Para que un auto pueda satisfacer un pedido se tienen que dar tres condiciones: 
- que la velocidad máxima del auto sea al menos 10 km/h mayor a la velocidad requerida del pedido; 
- que la capacidad del auto dé para la cantidad de pasajeros del viaje; y 
- que el auto no sea de un color incompatible para el viaje.

P.ej. consideremos al auto al que llamamos `cachito` en el test de la etapa 1 (recordemos: capacidad 4 pasajeros, velocidad máxima 150 km/h, color rojo).
- este auto puede satisfacer un pedido de 960 kms con tiempo máximo de 8 horas (lo que da una velocidad requerida de 120 km/h), para 4 pasajeros donde los colores incompatibles son azul y negro.
- si agregamos el rojo a los colores incompatibles, o cambiamos la cantidad de pasajeros a 6, entonces `cachito` ya no puede satisfacer el pedido.
- lo mismo si cambiamos el tiempo máximo a 6 horas, porque eso nos daría una velocidad requerida de 160 km/h.

Armar un test que compruebe esta especificación.

<br>

Además, los objetos que representan pedidos deben entender estos mensajes: `acelerar` disminuye en uno el tiempo máximo (p.ej. lo hace pasar de 8 horas a 7), y `relajar` que lo aumenta en uno (p.ej. lo hace pasar de 8 horas a 9).

## Etapa 3: registro de los pedidos de cada dependencia

Agregar a cada dependencia un registro de los pedidos que hace. Se pueden agregar y quitar pedidos.

Agregar lo que haga falta al modelo para que se pueda conocer, para una dependencia:
- el total de pasajeros en los pedidos que tiene registrados
- _cuáles_ de los pedidos que tiene registrados no puede ser satisfecho por ninguno de los autos afectados a la dependencia.
- dado un color, si es cierto que _todos_ los pedidos registrados lo tienen como color incompatible.

También debe ser posible, enviando un mensaje al objeto que representa a una dependencia, _relajar_ todos los pedidos que tenga registrados.

 

## Etapa 4: posiciones y Game

Agregarle a los Chevrolet Corsa un atributo `position` que indique su ubicación en un mapa de coordenadas. Supongamos que el mapa incluye las posiciones desde (0,0) hasta (15,15).
La clase `Position` "viene con Wollok", pero para usarla hay que incluir este import: 
```
import wollok.game.*
```

Este código crea una instancia de `Position`: `new Position(x = 4, y = 7)`.
Para ver qué mensajes entienden estos objetos, mirar en https://www.wollok.org/documentacion/wollokdoc/, entrar por "game.wlk" y buscar la clase "Position".

Otra forma de crear una instancia de `Position` es usando el objeto `game`: `game.at(4,7)`. Para usar a `game`, también hay que incluir el `import wollok.game.*`.  

Agregar lo que haga falta en la clase que modela a los Corsa para que puedan responder a las consultas
- `pasoPor(posicion)`, o sea, si alguna vez estuvo en esa posición. Ayuda: hay que agregar algo en el método que cambia la posición.
- `pasoPorFila(numero)`, la fila es el "x" de las posiciones. P.ej. si las posiciones en donde estuvo `cachito` fueron `(3,5)`, `(3.6)`, `(3,7)` y `(4,7)`, entonces pasó por las filas 3 y 4, y ninguna otra.
- `recorrioFilas(lista_de_numeros)`, o sea, si pasó por todas las filas en la lista. P.ej. `cachito.recorrioFilas([3,4,5])` tiene que dar `true` si `cachito` pasó por la fila 3, por la 4 y por la 5.

**Atenti**  
para resolver las últimas tres consultas, hay que agregar algo a la memoria de los Corsa.


### Meter un Corsa en el game

Aprovechando que los Corsa ya tienen posición (es importante que se llame `position`) agregarle una imagen y armar un programa que pone un auto en un Wollok Game.  
Hay un programa `corsasEnElGame.wpgm`, pueden usar ese.

Darle movimiento al auto con las flechas, y definir tres teclas para cambiarle el color, elegir para eso tres colores. P.ej. con "R" cambia a rojo, con "A" a azul, con "V" a verde.  
Para esto, buscar tres imágenes de autito en colores distintos, del tamaño que le gustan a Wollok Game, o sea 50x50 píxeles.

Recuerden que las imágenes tienen que estar en la carpeta `assets`, dejamos una de un auto rojo para que tengan de ejemplo.

#### Sugerencia (que pueden tomar o no)
  
Acá puede venir bien tener objetos que representen a cada color, p.ej. 
```
object blanco { }
object rojo { }
object azul { }
object beige { }
object negro { }
object verde { }
```
y agregarle a cada color una consulta para que te diga el nombre de la imagen. Así se evitan los "if" en el método `image()` en la clase de los Corsa.

P.ej. 
```
object rojo {
    method image() { return "autoRojo.png" } 
}
```

## Etapa 5: más sobre posiciones y Game

### Varios Corsa en el Game
Agregar más de un Corsa al auto. Acá pueden elegir el "auto activo" con teclas, p.ej. tengo 3 corsas, uso las teclas 1,2,3 para elegirlos. Pueden acceder a las teclas numéricas usando p.ej. `keyboard.num1()`.

El movimiento y el cambio de color se aplican al Corsa activo.

También pueden tener un modo "todos" en los que el movimiento y cambio de color se aplican a todos.


### Paredes
Definir objetos que representan paredes. Cada pared tiene una resistencia. Cuando un Corsa se "choca" con una pared (o sea, quiere ir a una celda en la que hay una pared), 
- si la resistencia de la pared es 0, entonces el Corsa pasa y la pared desaparece
- si no, el Corsa se queda donde está, y la resistencia de la pared disminuye en uno.
Pueden ponerle distintas imágenes a las paredes, de acuerdo a su resistencia.

### Direcciones

Definir objetos que representen a las distintas direcciones, por ejemplo `norte`, `sur`, etc., de forma tal que a un vehículo se le pueda decir:
`moverseHacia(direccion)`. P.ej. si se crea un vehículo así:
``` 
var miAutito = new ChevroletCorsa()
miAutito.position(game.at(3,6))
``` 
y después se hace `miAutito.moverse(norte)`, la posición del vehículo debería pasar a ser (3,7).

Después, agregarle estos métodos:
- `repetirUltimoMovimiento()`
- `estaEn(region)` donde hay que crear los objetos que representan regiones. Arranquemos con regiones rectangulares, por ejemplo del (3,3) al (5,8).

Después de esto, lograr que los objetos que representan regiones entiendan los mensajes `union(region)` e `interseccion(region)`, que devuelven las regiones que se indica. ¡OJO! que la unión de dos regiones rectangulares, puede no ser rectangular.


## Extra - desafíos con colecciones

Agregar métodos a las dependencias que permitan obtener:
- el conjunto de colores que son incompatibles para, al menos, un pedido. Los curiosos pueden investigar el método `flatten`; ver el apunte sobre colecciones que está en el sitio. 
- el color más popular. P.ej. si una dependencia tiene tres vehículos blancos, dos azules y uno negro, entonces el color más popular es el blanco.
- si se repite algún color, o sea si de algún color hay más de un vehículo. Acá puede servir `occurrencesOf(element)`, ver la documentación de Wollok o el apunte de colecciones.
- si los vehículos de una dependencia están en una lista, se puede pensar que están registrados según el orden en el que se fueron incorporando. Agregar un método `ordenDeLlegada(vehiculo)`: el primer vehículo en llegar tendrá orden 1, el segundo 2, etc..  
**Sugerencia**: while no hay, se van a tener que recorrer todos los vehículos, no hay problema. Puede venir cómodo recorrer _los índices_, para eso probar estas expresiones en un REPL: `(0..4)`, `(0..4).map({n => n * 2})`. Recordar que: hay que cortar en `vehiculos.size() - 1`, y que a partir del índice se puede acceder al elemento usando `get(indice)`.
- a partir del anterior, y mirando `take`, implementar `vehiculosQueLlegaronAntesQue(veh)`, que son los que aparecen antes en la lista.


## Notas bibliográficas

Coronel Vallejos no existe, es el pueblo ficticio donde transcurre _La traición de Rita Hayworth_, una novela de Manuel Puig.


## Un comentario para la implementación

En este ejercicio no damos ningún código inicial, les toca todo a ustedes. Van solamente algunos comentarios.

La mayor parte de los objetos que representan rodados van a ser instancias de alguna clase. No todos de la misma clase: las características de un Corsa son distintas que las de un Twid.

La excepción es la Trafic: dado que hay una sola, **no es necesario** crear una clase `Trafic`, puede ser tranquilamente un objeto bien conocido.

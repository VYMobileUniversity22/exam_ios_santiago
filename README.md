# Mobile Exam 2022 - STAR BRO'S
Como actividad de team building, la empresa  está  pensando  en  organizar  una  competición  sobre **Star Wars** para que sus trabajadores  compitan  en  pequeños  equipos y ver  cuál de ellos  tiene  más  conocimientos  sobre  los  personajes de la franquicia.

El equipo de Mobile ha decidido  implementar  una  aplicación que **liste  los  personajes** que aparecen  en las películas y de esta  manera  conocer  mejor  qué  personajes  han  coincidido y en  qué  películas de la saga.
## Requerimientos

- Cargar  todos  los  personajes y listarlos con paginación de tipo "endless" (Es posible que se deba  realizar  más de una  llamada a la API). *La paginación se debe  implementar sin usar ninguna  librería externa.* En el listado, cómo mínimo, tiene que mostrar:
 	- Foto para identificar el tipo de género
	- Nombre 
	- Fecha de nacimiento   
-   Al clicar  en  cualquier  personaje  debe  abrirse  una  nueva  pantalla  en la que se listarán las películas  en que ha participado, ordenado por **fecha de estreno**. Cómo mínimo se tiene que mostrar:
	- Nombre de la película
	- Director 
	- Fecha de estreno
-   La app debe  funcionar **sin conexión  a internet** con los  últimos  datos  cargados para que los  miembros del equipo  puedan acceder a la información  en  cualquier  circunstancia.
    
## SWAPI (The Star Wars API)

Fuente: [https://swapi.dev/](https://swapi.dev/)
Documentación: [https://swapi.dev/documentation](https://swapi.dev/documentation) 

## Extra - No obligatorio

### Requerimientos
-   Añadir un elemento de búsqueda por texto en el listado principal, para poder filtrar el nombre, que permitiría encontrar cualquier personaje de manera  rápida y sencilla.
-   Añadir  ordenación por fecha de nacimiento en la pantalla principal.
-   El equipo  quiere  minimizar al máximo las llamadas a la API.

### Cuestionario (a contestar por escrito en el README)

Contestad las siguientes preguntas  una  vez **terminado  el  proyecto** en el ***README***.

-   El equipo Mobile ha ganado  el  concurso y cree que la app puede ser útil para muchos fans de la franquicia,  por lo que han  decidido  publicarla  en las tiendas de aplicaciones y monetizarla. Se ha optado  por  mostrar  anuncios  en la aplicación, concretamente  en  los  listados de los  personajes. Los anuncios son generados  por  un SDK  interno de la compañía al que habrá que llamar  cada  vez que necesitemos  generar un anuncio. Cada X personajes  en  los  listados se quiere  mostrar un anuncio. ¿Qué  cambios  realizarías  en  el  proyecto para cubrir  esta  necesidad?
-   Se decide crear una segunda aplicación o Widget que comparta la misma fuente de datos local de personajes ya creada. ¿Qué  cambios  ejecutarías en el proyecto?


Primera pregunta:

Lo que haría es crear una funcion desde el presenter que por ejemplo me cree un numeroRandom el cual la llamaré luego en el ViewController y dentro de las funciones de la tableView accedería a la funcion de cellForItemAt y me encargaria de llamar  aquí esta funcion del presenter, metiendole a la funcion del AtIndex este numero random de tal manera que ahi se integre la publicidad de forma aleatoria en el array de personajes

Segund Pregunta:

Lo que haría es crear una storage a la que por medio del presenter acceda el widget y de esta forma compartir una misma Cache, de esta forma por ejemplo podria listar algo que tenga en la App  en el widget, de igual forma que el widget solo muestre en sus celdas un label en concreto  y en la app se pinten más componentes dentro de la misma celda


## Prueba Tecnica
    
Para iniciar la aplicación será necesario tener instalado Cocoapods, y, tras hacer un pod install se generará el workspace del proyecto

En la estructura del proyecto se podrán ver una carpeta "PruebaTecnica", donde está el desarrollo de la app, y "PruebaTecnicaUITests", donde se encuentran los tests de la interfaz de la app

Dentro de la carpeta "PruebaTecnica", hay una carpeta Workers, que contiene la llamada al servicio de la lista de personajes.

También hay una carpeta Commons, donde se encuentran la celda utilizada para las listas, una clase Utilities, una Encrypt y una Constants.

En la carpeta Models se encuentra el modelo en el que se han guardado los datos provenientes del servicio, y en la carpeta Scenes el desarrollo de las pantallas del listado de personajes y del detalle de estos. Para ello se ha utilizado la arquitectura VIP (Clean swift)

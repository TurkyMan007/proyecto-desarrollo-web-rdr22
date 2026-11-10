Proyecto Diseño Web - Evaluación 3

Hice una página que lee datos de una base de datos MySQL y los muestra en pantalla. Usamos la base de Red Dead Redemption 2 y mostramos los objetos del almacén con su stock.

Martin Alonso Márquez

Qué hace la página:
- se conecta a MySQL con Node y Express y muestra los objetos de la tabla Objeto con su tienda (tabla Tienda)
- tiene un filtro que funciona en la misma pantalla, sin recargar: se busca por nombre y se puede elegir todos, con stock o agotados
- arriba sale cuántos artículos hay en total, cuántos están disponibles y cuántos agotados
- si un artículo no tiene stock sale un sello rojo que dice AGOTADO

Usé: Node.js, Express, MySQL (mysql2 y cors), HTML, CSS, JavaScript, Bootstrap, Thunder Client y Live Server.

Las carpetas son estas:
- database: el archivo .sql con la base de datos
- backend: el servidor (server.js)
- frontend: la página (index.html, css y js)
- docs: las capturas de Thunder Client
En la raíz están este README y el package.json.

Cómo correrlo:

1) Prender MySQL. En Windows es Win + R, escribir services.msc, buscar MySQL80 y darle iniciar.

2) Cargar la base de datos. Lo más fácil es abrir database/RDR2Base.sql en MySQL Workbench (File, Open SQL Script) y apretar el rayo. Ojo que en PowerShell no funciona el signo < para cargarla por consola, ahí se usa:
```
mysql -u root -p -e "source database/RDR2Base.sql"
```

3) En backend/server.js hay que cambiar CONFIG_BD con el usuario y la contraseña de su MySQL. La contraseña real no la subimos a Git.

4) Instalar todo, en la carpeta raíz:
```
npm install
```

5) Prender el servidor, en una terminal dentro de la carpeta backend:
```
npm run dev
```
Tiene que decir "Servidor en http://localhost:3000". Esa terminal no hay que cerrarla.

6) Abrir http://localhost:3000 en el navegador. También se puede abrir frontend/index.html con Live Server.

Rutas de la API:
- GET /api/objetos: todos los objetos con su tienda
- GET /api/objetos/:id: un objeto por id (si no existe da 404)
- GET /api/tiendas: las tiendas

Pruebas con Thunder Client (las capturas están en la carpeta docs):

GET /api/objetos
![GET objetos](docs/get-objetos.png)

GET /api/objetos/1
![GET objeto por ID](docs/get-objeto-1.png)

GET /api/tiendas
![GET tiendas](docs/get-tiendas.png)

GET /api/objetos/999 (no existe, da 404)
![GET objeto inexistente](docs/get-objeto-404.png)

Cosas a tener en cuenta:
- en la base solo hay una tienda (Valentine) asociada a un objeto, por eso en la columna Tienda casi todos tienen un guion
- al final del archivo SQL hay unos UPDATE y DELETE que cambian algunos datos al cargarlo

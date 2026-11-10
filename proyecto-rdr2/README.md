# Inventario RDR2 – Proyecto Web con acceso a BD

Aplicación web que lee datos desde MySQL (base **RDR2**, tablas `Objeto` y `Tienda`)
y los muestra en pantalla con un filtro dinámico por nombre y por disponibilidad.

## Integrantes
- Nombre Apellido
- Nombre Apellido

## Tecnologías
Node.js · Express · MySQL (mysql2, cors) · HTML5 · CSS3 · JavaScript · Bootstrap 5 · Thunder Client · Live Server

## Estructura de carpetas
```
proyecto-rdr2/
├── README.md
├── package.json
├── database/
│   └── RDR2Base.sql
├── backend/
│   └── server.js
├── frontend/
│   ├── index.html
│   ├── css/style.css
│   └── js/app.js
└── docs/            (capturas de Thunder Client)
```

## Instrucciones

### 1. Iniciar MySQL (Windows)
- `Win + R` → `services.msc` → buscar `MySQL80` (o `MySQL57` / `MySQL`) → clic derecho → **Iniciar**.
- O desde CMD como administrador: `net start MySQL80`

### 2. Crear y poblar la base de datos
Cargar el archivo `database/RDR2Base.sql` (crea la base `RDR2` desde cero):
```bash
mysql -u root -p < database/RDR2Base.sql
```
(También se puede abrir y ejecutar desde MySQL Workbench.)

### 3. Configurar la conexión
En `backend/server.js`, editar el objeto `CONFIG_BD` con el usuario, la contraseña y la base de datos de tu MySQL.

### 4. Instalar dependencias
Desde la carpeta raíz del proyecto:
```bash
npm install
```
Esto instala `express`, `mysql2`, `cors` y `nodemon` (equivale a `npm install express mysql2 cors`).

### 5. Levantar el servidor backend
En una terminal dentro de `backend` (clic derecho en la carpeta → *Open in Integrated Terminal*):
```bash
npm run dev
```
(o `npm start`, o `node server.js`). Debe mostrar: `Servidor en http://localhost:3000`

### 6. Ver la página web
- Opción A: entrar a http://localhost:3000
- Opción B: abrir `frontend/index.html` con **Live Server** (clic derecho → *Open with Live Server*, o botón *Go Live*);
  se abre en http://127.0.0.1:5500 y consume la API en el puerto 3000.

## Rutas de la API (probadas con Thunder Client)
| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `http://localhost:3000/api/objetos` | Todos los objetos con su tienda |
| GET | `http://localhost:3000/api/objetos/1` | Un objeto por ID |
| GET | `http://localhost:3000/api/tiendas` | Listado de tiendas |

Las capturas de las pruebas están en la carpeta `docs/`.

## Filtro
Se hace en el navegador (DOM): búsqueda por nombre y selector Todos / Con stock / Sin stock.

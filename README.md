# GestorDeTareasNest

Backend del Gestor de Tareas desarrollado con NestJS. Expone una API REST organizada en módulos (usuarios, categorías, tareas, autenticación y WhatsApp) y utiliza PostgreSQL como base de datos relacional.

Estado actual: estructura del proyecto, módulos con sus rutas CRUD y base de datos diseñada y cargada con datos de ejemplo. La lógica de negocio y la conexión de la API con la base de datos se implementan en la siguiente etapa.

## Tecnologías

- NestJS
- TypeScript
- PostgreSQL
- @nestjs/config (variables de entorno)

## Requisitos

- Node.js y npm
- PostgreSQL
- Nest CLI (`npm install -g @nestjs/cli`)

## Instalación

```bash
git clone https://github.com/ivo99o/GestorDeTareasNest.git
cd GestorDeTareasNest
npm install
```

## Variables de entorno

Crear un archivo `.env` en la raíz del proyecto (no se sube al repositorio) con las siguientes variables:

| Variable | Descripción | Formato de ejemplo |
|----------|-------------|--------------------|
| `PORT` | Puerto en el que corre la API | `4000` |
| `DATABASE_URL` | Cadena de conexión a PostgreSQL | `postgresql://usuario:password@localhost:5432/nombre_db` |
| `API_BASE_URL` | URL base de la API | `http://localhost:4000/` |

Si PostgreSQL corre en un puerto distinto de 5432, se debe indicar en `DATABASE_URL`.

## Base de datos

El motor es PostgreSQL y el esquema está en la carpeta `database/`.

1. Crear la base de datos:

   ```sql
   CREATE DATABASE gestor_tareas;
   ```

2. Conectarse a `gestor_tareas` y ejecutar `database/schema.sql` para crear las tablas.
3. Ejecutar `database/seed.sql` para cargar los datos de ejemplo (5 usuarios, 5 categorías y 10 tareas).

### Tablas

| Tabla | Columnas | Restricciones |
|-------|----------|---------------|
| `usuarios` | `id`, `nombre`, `email`, `password`, `telefono` | `id` clave primaria; `email` único; `nombre`, `email` y `password` obligatorios |
| `categorias` | `id`, `nombre` | `id` clave primaria; `nombre` único y obligatorio |
| `tareas` | `id`, `titulo`, `descripcion`, `estado`, `fecha_vencimiento`, `usuario_id`, `categoria_id` | `id` clave primaria; `estado` solo acepta `pendiente`, `en_progreso` o `completada`; `usuario_id` clave foránea a `usuarios` (obligatoria, `ON DELETE CASCADE`); `categoria_id` clave foránea a `categorias` (opcional, `ON DELETE SET NULL`) |

### Relaciones

- Un usuario tiene muchas tareas.
- Una categoría tiene muchas tareas.
- Una tarea pertenece a un usuario y, opcionalmente, a una categoría.

## Cómo ejecutarlo

```bash
npm run start:dev
```

La API queda disponible en el puerto definido en `PORT` (por ejemplo, `http://localhost:4000/`).

## Estructura de carpetas

```
GestorDeTareasNest/
├── database/
│   ├── schema.sql
│   └── seed.sql
├── src/
│   ├── main.ts
│   └── modules/
│       ├── app/
│       ├── auth/
│       ├── categorias/
│       ├── tareas/
│       ├── usuarios/
│       └── whatsapp/
└── test/
```

Cada módulo contiene su controlador, servicio y módulo, además de las carpetas `dto/` y `entities/`.

## Endpoints

Los cinco módulos (`usuarios`, `categorias`, `tareas`, `auth` y `whatsapp`) exponen las mismas rutas CRUD:

| Método | Ruta | Descripción |
|--------|------|-------------|
| `POST` | `/{módulo}` | Crear un recurso |
| `GET` | `/{módulo}` | Listar todos los recursos |
| `GET` | `/{módulo}/:id` | Obtener un recurso por id |
| `PATCH` | `/{módulo}/:id` | Actualizar un recurso |
| `DELETE` | `/{módulo}/:id` | Eliminar un recurso |

Además, `GET /` devuelve un mensaje de bienvenida de la API.

## Postman

La colección con los endpoints de todos los módulos está en `docs/postman/GestorDeTareasAPI.postman_collection.json`.

Contiene 26 requests: la ruta raíz y las 5 rutas CRUD de cada módulo, organizadas en una carpeta por módulo. Cada request tiene su descripción, un cuerpo de ejemplo (en las de `POST` y `PATCH`) y un test que valida el código de estado de la respuesta.

### Cómo usarla

1. Tener la API corriendo con `npm run start:dev`.
2. En Postman, usar **Import** y seleccionar el archivo de la colección.
3. Verificar que la variable de colección `baseUrl` coincida con la URL de la API (por defecto `http://localhost:4000`).
4. Ejecutar las requests una por una o todas juntas con **Run**.

Para enviar requests a `localhost` se necesita la aplicación de escritorio de Postman (o su Desktop Agent).

## Flujo de ramas

| Rama | Uso |
|------|-----|
| `main` | Versión estable del proyecto |
| `dev` | Integración de los cambios antes de pasar a `main` |
| `feature/...` | Nuevas funcionalidades |
| `fix/...` | Corrección de errores |
| `refactor/...` | Reorganización del código sin cambiar su comportamiento |
| `docs/...` | Cambios en la documentación |

Cada cambio se desarrolla en su propia rama y se integra a `dev` mediante un Pull Request.

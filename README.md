# TrackQR

![Vista de Wireframe](docs/wireframe.png)

# TrackQR

TrackQR es una aplicación web (enfoque backend) para **generar códigos QR asociados a un usuario logueado** y **medir escaneos/visitas** de cada QR mediante un endpoint de tracking.

La idea del proyecto es didáctica: Como base para enseñar un backend con autenticación, modelos, controladores, endpoints REST, y registro de métricas.

---

## Objetivo del proyecto

- Permitir que un **usuario autenticado** cree códigos QR.
- Cada QR apunta a una URL de tracking del estilo:
  - `/q/{code}` o `/r/{code}`
- Cuando alguien escanea ese QR:
  - Se registra una **visita** (métrica)
  - Se redirige al **destino final** configurado

---

## Features (MVP)

### Autenticación
- Registro (opcional) / Login
- Sesión o token (según el stack que implementes)
- Rutas protegidas para gestionar QRs

### Gestión de QRs
- Crear QR con:
  - `title` (opcional)
  - `destination_url` (URL final)
  - `code` (slug/hash único)
  - `created_by` (usuario)

### Tracking de visitas
- Endpoint público:
  - `GET /q/{code}`
- Acciones:
  1. Buscar el QR por `code`
  2. Registrar visita con metadatos básicos
  3. Redirigir a `destination_url`

---

## Estructura sugerida (MVC)

> Ejemplo genérico (adaptable a PHP MVC, Node/Express MVC, etc.)


## 🗄️ Modelo de Datos

### ERD (Entity Relationship Diagram)

```mermaid
erDiagram
    USERS ||--o{ QRS : "creates"
    QRS   ||--o{ VISITS : "receives"
    USERS ||--o{ LOGIN_LOGS : "auth attempts"

    USERS {
        int user_id PK
        varchar name
        varchar email UK
        varchar password_hash
        tinyint is_active
        timestamp created_at
    }

    QRS {
        int qr_id PK
        int user_id FK
        varchar destination_url
        timestamp created_at
    }

    VISITS {
        bigint visit_id PK
        int qr_id FK
        timestamp visited_at
        varchar ip_address
        varchar user_agent
        varchar referer
        varchar language
        varchar device_type
        varchar operating_system
        int screen_width
        int screen_height
        int timezone_offset
        varchar session_id
    }

    LOGIN_LOGS {
        bigint login_id PK
        int user_id FK
        timestamp logged_at
        varchar ip_address
        varchar user_agent
        tinyint success
    }
```

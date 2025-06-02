# ⚽ App de Gestión de Equipos de Fútbol

Aplicación móvil desarrollada en **Flutter** que permite gestionar equipos de fútbol de forma local. Los usuarios pueden crear equipos, asignar entrenadores, agregar jugadores, visualizar la plantilla y aplicar filtros por posición. Ideal para pruebas técnicas, portafolios o como base para proyectos deportivos.

---

## 📱 Características principales

- ✅ Crear equipos con nombre e imagen (escudo).
- ✅ Asignar entrenadores con nombre, edad y estrategia.
- ✅ Agregar jugadores con datos personales y posición.
- ✅ Visualizar detalles del equipo y entrenador.
- ✅ Mostrar jugadores en cuadrícula con tarjetas.
- ✅ Filtrar jugadores por posición.
- ✅ Estilo moderno, responsivo y limpio.


## 📷 Capturas de pantalla

### 🏠 Página Inicial
<img src="screenshots/home.jfif" alt="Página Inicial" width="500"/>

### 🏟️ Detalle del Equipo
<img src="screenshots/team_detail.jfif" alt="Detalle del equipo" width="500"/>

### 📋 Lista de Equipos
<img src="screenshots/teams.jfif" alt="Lista de equipos" width="500"/>

### 📁 Menú del Equipo
<img src="screenshots/menu.jfif" alt="Menú del equipo" width="500"/>

### 👥 Listado de Jugadores
<img src="screenshots/player_list.jfif" alt="Listado de jugadores" width="500"/>

### 🧠 Simulación de Partidos
<img src="screenshots/simulated.jfif" alt="Simulación de partidos" width="500"/>

---

## ⚙️ Instalación y Ejecución
## 📲 Móvil (Flutter)
```bash
git clone https://github.com/carlosFFR/futbol-app
cd luka-app
flutter pub get
flutter run

## 🧱 Estructura del proyecto

lib/
├── controllers/ # Controladores para manejar lógica
├── models/ # Modelos de datos: Team, Player, Coach
├── screens/ # Pantallas principales y de detalle
├── widgets/ # Componentes reutilizables como PlayerCard
├── theme/ # Archivo AppTheme para colores y estilos globales
└── main.dart # Entrada principal de la app






🧩 Tecnologías utilizadas
Flutter (Dart)

sqflite para base de datos local (SQLite)

Arquitectura tipo MVC (Modelo - Vista - Controlador)

Buenas prácticas en organización de carpetas y código limpio

📌 Estado del proyecto
[✔️] UI funcional y responsiva

[✔️] Almacenamiento local con sqflite

[✔️] CRUD de equipos, jugadores y entrenadores

[✔️] Validaciones en formularios

[🟡] Se puede extender con estadísticas y simulaciones

👨‍💻 Autor
Carlos Rios
Desarrollador Flutter | Full Stack
✉️ Email: carlosfernandofloresrios@gamil.com
💬 WhatsApp: +591 67344906
🌐 Portafolio: carlos-rios.vercel.app

📝 Licencia
Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.
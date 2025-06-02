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

### 🏟️ Detalle del equipo
![Detalle del equipo](screenshots/team_detail.jfif)

### 👥 Listado de jugadores
![Listado de jugadores](screenshots/player_list.jfif)
### 👥 Pagina inicial
![Pagina Inicial](screenshots/home.jfif)
### 👥 Menu de cada equipo
![Menu](screenshots/menu.jfif)
### 👥 Lista de equipos
![Equipos](screenshots/teams.jfif)
###  Simulated 
![Simulacion](screenshots/simulated.jfif)
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
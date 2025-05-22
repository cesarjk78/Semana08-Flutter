import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Tareas',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaInicio(),
        '/registro': (context) => const RegistroUsuario(),
        '/menu': (context) => const MenuPrincipal(),
        '/registro_tarea': (context) => const RegistroTareas(),
        '/registro_producto': (context) => const RegistroProducto(), // nueva ruta
      },
    );
  }
}

// Pantalla 1: Gestor de Tareas
class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Gestor de tareas',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/registro'),
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla 2: Registro de Usuario
class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({super.key});
  @override
  State<RegistroUsuario> createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController ocupacionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Usuario')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: ocupacionController,
              decoration: const InputDecoration(labelText: 'Ocupación'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/menu'),
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla 3: Menú Principal

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Principal')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Home'),
                // Profile clickeable
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/registro_producto');
                  },
                  child: const Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/registro_tarea');
                  },
                  child: const Text(
                    'Tareas',
                    style: TextStyle(
                      color: Colors.blue, 
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // Botón Continuar eliminado
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}



// Pantalla 4: Registro de Tareas
class RegistroTareas extends StatefulWidget {
  const RegistroTareas({super.key});
  @override
  State<RegistroTareas> createState() => _RegistroTareasState();
}

class _RegistroTareasState extends State<RegistroTareas> {
  String nombreSeleccionado = 'Juan';
  final List<String> nombres = ['Juan', 'María', 'Carlos', 'Ana'];
  final List<String> tareas = ['Trabajo 1', 'Trabajo anexos', 'Trabajo extra'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Tareas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              value: nombreSeleccionado,
              onChanged: (nuevoNombre) {
                setState(() {
                  nombreSeleccionado = nuevoNombre!;
                });
              },
              items: nombres.map((nombre) {
                return DropdownMenuItem<String>(
                  value: nombre,
                  child: Text(nombre),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tareas asignadas:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...tareas.map((tarea) => ListTile(
                  title: Text(tarea),
                  leading: const Icon(Icons.check_circle_outline),
                )),
          ],
        ),
      ),
    );
  }
}

// Nueva pantalla RegistroProducto
class RegistroProducto extends StatefulWidget {
  const RegistroProducto({super.key});
  @override
  State<RegistroProducto> createState() => _RegistroProductoState();
}

class _RegistroProductoState extends State<RegistroProducto> {
  final TextEditingController nombreProductoController = TextEditingController();
  final TextEditingController precioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Productos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nombreProductoController,
              decoration: const InputDecoration(
                labelText: 'Nombre del producto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Espacio para la imagen (solo visual)
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Center(child: Text('Espacio para imagen')),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: precioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Precio',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aquí podrías agregar la lógica para guardar si quieres
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Producto guardado')),
                  );
                },
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
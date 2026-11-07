// Importa las herramientas necesarias de Flutter.
import 'package:flutter/material.dart';

// Función principal de la aplicación.
void main() {
  // Muestra un mensaje de inicio en la consola.
  print('Iniciando FormularioCorreoUAE');

  // Ejecuta la aplicación.
  runApp(const MiAplicacion());
}

// Clase principal de la aplicación.
class MiAplicacion extends StatelessWidget {
  // Constructor de la clase.
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    // Configura la aplicación.
    return MaterialApp(
      // Oculta la etiqueta de depuración.
      debugShowCheckedModeBanner: false,

      // Nombre de la aplicación.
      title: 'FormularioCorreoUAE',

      // Establece la pantalla principal.
      home: const FormularioCorreo(),
    );
  }
}

// Pantalla que contiene el formulario de correo.
class FormularioCorreo extends StatefulWidget {
  // Constructor de la pantalla.
  const FormularioCorreo({super.key});

  @override
  State<FormularioCorreo> createState() => _FormularioCorreoState();
}

// Clase que controla el estado del formulario.
class _FormularioCorreoState extends State<FormularioCorreo> {
  // Controla el texto ingresado por el usuario.
  final TextEditingController _ctrl = TextEditingController();

  // Guarda el resultado que se mostrará en pantalla.
  String _resultado = '';

  // Función que procesa el correo ingresado.
  void _enviarCorreo() {
    // Muestra un mensaje en la consola.
    print('Botón Enviar presionado');

    // Obtiene el contenido del campo y elimina espacios externos.
    final String correo = _ctrl.text.trim();

    // Muestra el correo ingresado en la consola.
    print('Correo ingresado: $correo');

    // Comprueba que el campo no esté vacío.
    if (correo.isEmpty) {
      // Muestra un mensaje en la consola.
      print('El campo de correo está vacío');

      // Informa al usuario que debe ingresar un correo.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingresa tu correo electrónico'),
        ),
      );

      // Finaliza la función si no hay información.
      return;
    }

    // Actualiza el resultado y redibuja la pantalla.
    setState(() {
      // Guarda el correo ingresado.
      _resultado = correo;
    });

    // Confirma que el resultado se actualizó.
    print('Correo mostrado correctamente: $_resultado');
  }

  @override
  Widget build(BuildContext context) {
    // Construye la estructura principal de la pantalla.
    return Scaffold(
      // Barra superior de la aplicación.
      appBar: AppBar(
        // Título de la aplicación.
        title: const Text('Formulario de correo'),

        // Centra el título.
        centerTitle: false,

        // Establece el color azul de la barra.
        backgroundColor: const Color(0xFF1565C0),

        // Establece el color blanco del texto.
        foregroundColor: Colors.white,

        // Evita elevar la barra.
        elevation: 0,
      ),

      // Contenido principal de la pantalla.
      body: SafeArea(
        child: Padding(
          // Establece el espacio alrededor de los elementos.
          padding: const EdgeInsets.all(16.0),

          // Organiza los elementos verticalmente.
          child: Column(
            // Alinea los elementos al inicio.
            crossAxisAlignment: CrossAxisAlignment.start,

            // Lista de elementos del formulario.
            children: [
              // Etiqueta del campo de correo.
              const Text(
                'Ingresa tu correo',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),

              // Espacio entre la etiqueta y el campo.
              const SizedBox(height: 10),

              // Campo para ingresar el correo electrónico.
              TextField(
                // Conecta el campo con el controlador.
                controller: _ctrl,

                // Configura el teclado para correos electrónicos.
                keyboardType: TextInputType.emailAddress,

                // Evita que el teclado agregue una acción de autocorrección.
                autocorrect: false,

                // Desactiva las sugerencias del teclado.
                enableSuggestions: false,

                // Permite finalizar el ingreso desde el teclado.
                textInputAction: TextInputAction.done,

                // Ejecuta el envío al pulsar la tecla de finalizar.
                onSubmitted: (_) => _enviarCorreo(),

                // Configura la apariencia del campo.
                decoration: const InputDecoration(
                  // Muestra un ejemplo dentro del campo.
                  hintText: 'estudiante@uae.edu.ec',

                  // Establece el borde del campo.
                  border: OutlineInputBorder(),

                  // Reduce el tamaño del campo.
                  isDense: true,

                  // Espaciado interno.
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                ),
              ),

              // Espacio entre el campo y el botón.
              const SizedBox(height: 15),

              // Botón para enviar el correo.
              SizedBox(
                // Ocupa todo el ancho disponible.
                width: double.infinity,

                // Establece la altura del botón.
                height: 45,

                child: ElevatedButton(
                  // Ejecuta la función al pulsar el botón.
                  onPressed: _enviarCorreo,

                  // Configura los colores del botón.
                  style: ElevatedButton.styleFrom(
                    // Fondo verde.
                    backgroundColor: const Color(0xFF2E7D32),

                    // Texto blanco.
                    foregroundColor: Colors.white,

                    // Elimina las elevaciones.
                    elevation: 0,

                    // Redondea ligeramente las esquinas.
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),

                  // Texto del botón.
                  child: const Text(
                    'Enviar',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Espacio antes del resultado.
              const SizedBox(height: 15),

              // Muestra el correo ingresado.
              Text(
                // Comprueba si existe un resultado.
                _resultado.isEmpty
                    ? 'Correo ingresado:'
                    : 'Correo ingresado:\n$_resultado',

                // Alinea el resultado a la izquierda.
                textAlign: TextAlign.left,

                // Configura el estilo del resultado.
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173B65),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // Libera los recursos utilizados por el controlador.
  void dispose() {
    // Libera el controlador del campo de texto.
    _ctrl.dispose();

    // Muestra un mensaje en la consola.
    print('Controlador liberado');

    // Ejecuta la limpieza correspondiente.
    super.dispose();
  }
}
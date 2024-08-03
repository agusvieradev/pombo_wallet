import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthFormContainer extends ConsumerWidget {
  const AuthFormContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Material(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          elevation: 4.0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
            width: 700,
            height: 650,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bienvenido a Pombo',
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        color: Color.fromARGB(255, 43, 43, 43),
                        fontWeight: FontWeight.bold,
                        fontSize: 36.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Iniciá sesión con tu correo y contraseña',
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        color: Color.fromARGB(255, 163, 163, 163),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        style: const TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 22,
                        ),
                        decoration: const InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        controller: passwordController,
                        style: const TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 22,
                        ),
                        decoration: const InputDecoration(
                          label: Text(
                            'Contraseña',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Color.fromARGB(255, 20, 149, 255),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width:
                          double.infinity, // Ocupa todo el ancho del contenedor
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 20, 149, 255),
                          ),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Ingresar',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '¿No tenes cuenta?',
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Color.fromARGB(255, 43, 43, 43),
                            fontSize: 20,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Crear una',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Comfortaa',
                              color: Color.fromARGB(255, 20, 149, 255),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

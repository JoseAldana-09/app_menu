import 'package:flutter/material.dart';

void main() {
  runApp(const AplicacionUtilidades());
}

class AplicacionUtilidades extends StatelessWidget {
  const AplicacionUtilidades({super.key});

  @override
  Widget build(BuildContext contexto) {
    return MaterialApp(
      title: 'Aplicación de Utilidades',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MenuPrincipal(),
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  contexto,
                  MaterialPageRoute(
                      builder: (contexto) => PantallaPalindromo()),
                );
              },
              child: const Text('Verificar Palíndromo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  contexto,
                  MaterialPageRoute(builder: (contexto) => PantallaAmigos()),
                );
              },
              child: const Text('Identificar Números Amigos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  contexto,
                  MaterialPageRoute(builder: (contexto) => PantallaBinario()),
                );
              },
              child: const Text('Convertir a Binario'),
            ),
          ],
        ),
      ),
    );
  }
}

class PantallaPalindromo extends StatelessWidget {
  PantallaPalindromo({super.key});
  final TextEditingController controladorTexto = TextEditingController();

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verificar Palíndromo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controladorTexto,
              decoration: const InputDecoration(
                labelText: 'Ingrese una oración',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              enableSuggestions: false,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final texto =
                    controladorTexto.text.replaceAll(' ', '').toLowerCase();
                final esPalindromo = texto == texto.split('').reversed.join();
                final resultado =
                    esPalindromo ? 'Es un palíndromo' : 'No es un palíndromo';

                showDialog(
                  context: contexto,
                  builder: (contexto) => AlertDialog(
                    content: Text(resultado),
                  ),
                );
              },
              child: const Text('Verificar'),
            ),
          ],
        ),
      ),
    );
  }
}

class PantallaAmigos extends StatelessWidget {
  PantallaAmigos({super.key});
  final TextEditingController controladorNumero1 = TextEditingController();
  final TextEditingController controladorNumero2 = TextEditingController();

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(title: const Text('Identificar Números Amigos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controladorNumero1,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Ingrese el primer número'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controladorNumero2,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Ingrese el segundo número'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final numero1 = int.tryParse(controladorNumero1.text) ?? 0;
                final numero2 = int.tryParse(controladorNumero2.text) ?? 0;

                bool sonAmigos(int a, int b) {
                  int sumaDivisores(int n) {
                    return List.generate(n, (i) => i + 1)
                        .where((i) => i != n && n % i == 0)
                        .reduce((a, b) => a + b);
                  }

                  return sumaDivisores(a) == b && sumaDivisores(b) == a;
                }

                final resultado = sonAmigos(numero1, numero2)
                    ? 'Son números amigos'
                    : 'No son números amigos';

                showDialog(
                  context: contexto,
                  builder: (contexto) => AlertDialog(
                    content: Text(resultado),
                  ),
                );
              },
              child: const Text('Verificar'),
            ),
          ],
        ),
      ),
    );
  }
}

class PantallaBinario extends StatelessWidget {
  PantallaBinario({super.key});
  final TextEditingController controladorNumero = TextEditingController();

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(title: const Text('Convertidor a Binario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controladorNumero,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Ingrese un número entero'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final numero = int.tryParse(controladorNumero.text) ?? 0;
                final binario = numero.toRadixString(2);

                showDialog(
                  context: contexto,
                  builder: (contexto) => AlertDialog(
                    content: Text('Representación binaria: $binario'),
                  ),
                );
              },
              child: const Text('Convertir'),
            ),
          ],
        ),
      ),
    );
  }
}

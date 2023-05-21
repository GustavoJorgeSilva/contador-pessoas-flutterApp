import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });

    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });

    print(count);
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/pexels-lisa-fotios-1833306.jpg.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode entrar',
              style: TextStyle(
                fontSize: 30,
                color: isFull ? Colors.red : Colors.black,
                fontWeight: FontWeight.w400,
                letterSpacing: 3,
              ),
            ),
            Text('$count',
                style: TextStyle(
                  fontSize: 80,
                  color: isFull ? Colors.red : Colors.black,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                )),
            const SizedBox(
              // widget invisivel para espaçar a coluna da linha
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.2)
                          : Colors.white,
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  child: const Text(
                    'Saiu!',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  // widget invisivel para espaçar um botão do outro
                  width: 32,
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                      backgroundColor:
                          isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  child: const Text(
                    'Entrou!',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

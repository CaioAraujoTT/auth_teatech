import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:auth_teatech/extension/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timerLoading;
  Timer? timer;
  double counterAdd = 0.0;
  List<String> list = [];
  List<bool> visibleList = [];
  String randomNumber = '';

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      list.add(generateRandomNumber());
    }
    list.insert(0, generateNewNumber());
    timer = Timer.periodic(
      const Duration(minutes: 1),
      (temporizador) {
        visibleList.removeAt(0);
        visibleList.insert(0, false);
        if (counterAdd != 1.0) {
          setState(() => counterAdd += 0.5);
          list.insert(0, generateNewNumber());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Novo autenticador gerado!'),
              duration: Duration(seconds: 5),
            ),
          );
        } else {
          temporizador.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Autenticador Teatech',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          String number = list[index];
          bool visible = visibleList[index];
          if (index == 0) {
            visible = true;
          }
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: visible
                    ? index == 0
                        ? Colors.green
                        : Colors.red
                    : Colors.red,
                width: 2,
              ),
            ),
            child: ListTile(
              isThreeLine: true,
              title: visibleItem(
                  Text(
                    number,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  visible),
              subtitle: visibleItem(
                  Text(
                      'Clínica Mundos Ilha do Leite - ${DateTime.now().formatToBr()}'),
                  visible),
              leading: index == 0
                  ? const Icon(Icons.verified, color: Colors.green)
                  : const Icon(Icons.lock, color: Colors.red),
              trailing: index == 0
                  ? null
                  : IconButton(
                      icon: visible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          visibleList[index] = !visible;
                        });
                      },
                    ),
              onTap: visible
                  ? () {
                      Clipboard.setData(ClipboardData(text: number));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Número do autenticador copiado!'),
                          duration: Duration(seconds: 5),
                        ),
                      );
                    }
                  : null,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // Remove o primeiro elemento da lista de visibilidade
            if (visibleList.isNotEmpty) {
              visibleList.removeAt(0);
            }

            // Insere um novo número na lista e define sua visibilidade como true
            list.insert(0, generateNewNumber());
            visibleList.insert(0, true);

            // Reinicia o contador
            counterAdd = 0.0;

            // Exibe uma mensagem de SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Novo autenticador gerado!'),
                duration: Duration(seconds: 5),
              ),
            );
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      persistentFooterButtons: const [
        LinearProgressIndicator(
          color: Colors.blue,
        ),
      ],
    );
  }

  /// - Clinica: C
  /// - cod_clinica: 0001
  /// - sigla_clinica: M
  /// - divisor: #
  /// - data: yy-mm-dd
  String generateNewNumber() {
    String number = '';
    number += DateTime.now().formatToCode();
    number += '...';
    visibleList.insert(0, false);
    return number;
  }

  String generateRandomNumber() {
    final Random random = Random();
    String number = '';
    for (int i = 0; i < 12; i++) {
      number += random.nextInt(10).toString();
    }
    visibleList.add(false);
    return number;
  }
}

Widget visibleItem(Widget child, bool visible) {
  return ImageFiltered(
    imageFilter: !visible
        ? ImageFilter.blur(sigmaX: 2, sigmaY: 2)
        : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
    child: child,
  );
}

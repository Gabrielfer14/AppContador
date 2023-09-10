import 'package:flutter/material.dart';

void main() {
  runApp(const AplicativoDeContar());
}

class AplicativoDeContar extends StatelessWidget {
  const AplicativoDeContar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de Contar Academia',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const TelaDoContador(),
    );
  }
}

class TelaDoContador extends StatefulWidget {
  const TelaDoContador({super.key});

  @override
  _TelaDoContadorState createState() => _TelaDoContadorState();
}

class _TelaDoContadorState extends State<TelaDoContador> {
  int contas = 0;
  int limiteMaximo = 45; // Defina o limite máximo para 45

  void aumentarContas() {
    if (contas < limiteMaximo) {
      setState(() {
        contas++;
      });
    } else {
      // Caso o limite seja atingido, exibir essa mensagem
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Limite Excedido'),
            content: Text(
                'O limite máximo de $limiteMaximo pessoas foi atingido. Espere alguém sair.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void diminuirContas() {
    setState(() {
      if (contas > 0) {
        contas--;
      }
    });
  }

  void fecharAcademia() {
    // Funçao para zerar o numero de pessoas na academia
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fechar Academia'),
          content: const Text('Deseja realmente fechar a academia?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                zerarContas();
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  void zerarContas() {
    setState(() {
      contas = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('imagens/imagem.jpg'), // Caminho para a imagem
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Número de Pessoas na Academia:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '$contas',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: diminuirContas,
                      child: const Text(
                        '-',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: aumentarContas,
                      child: const Text(
                        '+',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: fecharAcademia,
                  child: const Text(
                    'Fechar Academia',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

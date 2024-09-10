import 'package:flutter/material.dart';
import 'screens/calculator.dart'; // Importa o arquivo da calculadora
import 'screens/jogo_da_velha.dart'; // Importa o arquivo do jogo da velha
import 'screens/tic_tac_toe.dart'; // Importa o arquivo do Tic Tac Toe

void main() => runApp(MaterialApp(home: Scaffold(appBar: AppBar(title: Text("App Launcher")), body: AppList())));

class AppList extends StatefulWidget {
  const AppList({Key? key}) : super(key: key);

  @override
  State<AppList> createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  var appData = AppHelper.getApps();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appData.length,
      itemBuilder: (context, index) {
        final app = appData[index];
        return ListTile(
          title: Text(app.name),
          onTap: () {
            // Navega para a funcionalidade correspondente
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => app.functionality),
            );
          },
        );
      },
    );
  }
}

// Modelo de um aplicativo ou funcionalidade
class AppModel {
  String name;
  Widget functionality;

  AppModel({required this.name, required this.functionality});
}

// Classe para obter a lista de aplicativos
class AppHelper {
  static List<AppModel> getApps() {
    return [
      AppModel(name: "Tic Tac toe", functionality: TicTacToe()), // Exemplo de um jogo
      AppModel(name: "Calculadora", functionality: CalculatorPage()), // Outra funcionalidade
      AppModel(name: "Jogo da Velha", functionality: JogoDaVelhaPage()), // Outra funcionalidade
    ];
  }
}

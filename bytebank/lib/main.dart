import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp()); //hot reload, funciona quando o App está dentro de um Stateless/full

//primeiro Widget do App, que controla as telas 
class ByteBankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
    //theme: ThemeData.dark(),  
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.red[900], 
        secondary: Colors.grey[900]),

        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[900],
        ),
    ),

    home: ListaTransferencias(), //root
    );
  }
}
 








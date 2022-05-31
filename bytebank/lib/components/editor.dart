//alterar dados formulário 1
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  const Editor({
    required this.controlador, 
    required this.rotulo, 
    required this.dica, 
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 16.0), ////all(16.0) OK || symmetric(x,y)
      child: TextField(
        controller: controlador,
        style: TextStyle(
          //base 8 // 16 // 24
          fontSize: 18.0        
        ),
        decoration: InputDecoration(
          // ignore: unnecessary_null_comparison
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
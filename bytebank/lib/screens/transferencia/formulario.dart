
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Nova Transferência";
const _rotuloCampoValor = "Valor";
const _dicaCampoValor = "0.00";
const _dicaCampoNumeroConta = "0000";
const _rotuloCampoNumeroConta = "Número da conta";
const _textoBotaoConfirmar = "Confirmar";

//extends statefull: possível modificar o conteudo de maneira dinâmica 
//extends stateless: conteudo fixo, idela começar com ele e depois colocar dinâmico

//formulario transferencia
class FormularioTransferencia extends StatefulWidget {
 
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState(); //resolve o bug de apagar campos forms quando o usuario rotaciona a tela
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  
  final TextEditingController _controllerConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

 @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var icone = null;
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),

      body: SingleChildScrollView(  //caso o usuário rotacione a tela, o app da scroll
        child: Column(
      
          children: <Widget> [
            //Posso escolher a ordem dos argumentos
            //Campo Conta
            Editor(
              controlador: _controllerConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
              icone: Icons.account_balance
            ),

            //Campo Valor
            Editor(
              controlador:_controllerValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on
            ),
      
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    //debugPrint("Clicou no confirmar");
    //Acesso ao conteudo capturado no campo
    //captura de dados
    final int? numeroConta = int.tryParse(_controllerConta.text);
    final double? valorTransferencia = double.tryParse(_controllerValor.text);
    if(numeroConta != null && valorTransferencia != null){
      //var transferencia = Transferencia;
      final transferenciaCriada = Transferencia(valorTransferencia, numeroConta);
      //debugPrint("Criando transferencia");
      //debugPrint("$transferenciaCriada"); //retorna objeto, então criei toString() na class transferencia
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
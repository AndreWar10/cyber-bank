import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Transferências";

class ListaTransferencias extends StatefulWidget { 
  
final List<Transferencia> _transferencias = [];  //acesso ele com widget.

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
} 

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {  //build sempre executa
    //widget._transferencias.add(Transferencia(220.50, 445));

    return Scaffold(
      appBar: AppBar(
      title: Text(_tituloAppBar),
      ),

      body: ListView.builder(
          itemCount: widget._transferencias.length, 
          itemBuilder:(context, indice) { //função callback
            final transferencia = widget._transferencias[indice]; 
            return ItemTransferencia(transferencia);
          }, 
        ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //future: como se fosse um callBack
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }))
          .then((transferenciaRecebida) =>  _atualiza(transferenciaRecebida));
        },
      ),
    );
  }

  void _atualiza(Transferencia? transferenciaRecebida) {
    //debugPrint('chegou no then do future');
    //debugPrint('$transferenciaRecebida');
    if(transferenciaRecebida != null){//importante verificar se transferencia não é nula
      setState(() { //USAR SEMPRE QUE FOR ATUALIZAR CONTEUDO STATE
        widget._transferencias.add(transferenciaRecebida); 
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;
  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(_transferencia.valor.toString()),
              subtitle: Text(_transferencia.numeroConta.toString()),
            ),
          );
  }
}

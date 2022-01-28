import 'package:flutter/material.dart';
import 'pallete.dart';
import 'medicamento.dart';
import 'form.dart';

class ListaMedicamentos extends StatefulWidget {

  State<StatefulWidget> createState() {
    return ListaMedicamentosState();
  }
}

class ListaMedicamentosState extends State<ListaMedicamentos> {

  final List<Medicamento> _medicamentos = List.filled(0, Medicamento('a', 'a', 1.0, 1, 'a', 'a'), growable: true);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
        itemCount: _medicamentos.length,
        itemBuilder: (context, indice) {
          final medicamento = _medicamentos[indice];
          return ItemMedicamento(medicamento);
        },),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.add), onPressed: () {
        final Future future = Navigator.push(
            context, MaterialPageRoute(builder: (context) {
          return MyFormPage();
        }
        ));

        future.then((medicamentoRecebido) {
          if (medicamentoRecebido != null){
            _medicamentos.add(medicamentoRecebido);
            int len = _medicamentos.length;
            debugPrint('$len');
            setState(() {});
          }

        }

        );
      }),
    );
  }
}

class ItemMedicamento extends StatelessWidget {
  final Medicamento _medicamento;

  ItemMedicamento(this._medicamento);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          title: Text(_medicamento.nome.toString()),
          subtitle: Text(_medicamento.descricao.toString()),
        )
    );
  }
}
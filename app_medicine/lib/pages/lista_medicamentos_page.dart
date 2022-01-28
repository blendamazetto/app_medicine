import 'package:cadastro_medicamento/utils/pallete.dart';
import 'package:flutter/material.dart';
import '../data/medicamento.dart';
import '../form.dart';

class ListaMedicamentos extends StatefulWidget {
  const ListaMedicamentos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaMedicamentosState();
  }
}

class ListaMedicamentosState extends State<ListaMedicamentos> {
  final List<Medicamento> _medicamentos =
      List.filled(0, Medicamento('a', 'a', 1.0, 1, 'a', 'a'), growable: true);

  onAddMedicamento() {
    final Future future =
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyFormPage();
    }));

    future.then((medicamentoRecebido) {
      if (medicamentoRecebido != null) {
        _medicamentos.add(medicamentoRecebido);
        int len = _medicamentos.length;
        debugPrint('$len');
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.blackToWhite[800],
      body: ListView.builder(
        itemCount: _medicamentos.length,
        itemBuilder: (context, indice) {
          final medicamento = _medicamentos[indice];
          return ItemMedicamento(medicamento);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: onAddMedicamento,
          backgroundColor: Palette.pinkToWhite,
          elevation: 1,
        ),
      ),
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
    ));
  }
}

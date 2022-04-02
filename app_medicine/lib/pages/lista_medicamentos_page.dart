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
      List.filled(0, Medicamento('a', 'a', 1.0, 1, 'a', 'a', 'a', 'a', 'a'), growable: true);

  onAddMedicamento() {
    final Future future =
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const MyFormPage();
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
          foregroundColor: Colors.white,
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

  const ItemMedicamento(this._medicamento, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        color: Palette.pinkToWhite,
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 3),
          title: Text(
            _medicamento.nome.toString(),
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Palette.blackToWhite[300]
            )
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    color: Colors.white
                  ),
                  children: <TextSpan>[
                    TextSpan(text: _medicamento.descricao.toString()),
                    TextSpan(text: '\n${_medicamento.quantidade.toString()} '),
                    TextSpan(text: _medicamento.valueQ.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    TextSpan(text: '\n${_medicamento.frequencia.toString()} vez(es)'),
                    TextSpan(text: '/${_medicamento.valueF.toString()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(text: '\nHorário: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: _medicamento.tempo.toString()),
                    TextSpan(text: '\n${_medicamento.data.toString()}',),
                    TextSpan(text: '\nTipo: ${_medicamento.tipo.toString()}\n'),
                  ]
                )
              ),
            Container(
              alignment: Alignment.bottomCenter,
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Palette.blackToWhite[900]),
                    ),
                    child: const Text(
                      'EDITAR',
                      style: TextStyle(color: Color(0xffef6f86))
                  )),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Palette.blackToWhite[900]),
                    ),
                    child: const Text(
                      'EXCLUIR',
                      style: TextStyle(color: Color(0xffef6f86))
                  )),
                ],
              ),
            )
            ],
          ),
          
        )
      ),
    );
  }
}

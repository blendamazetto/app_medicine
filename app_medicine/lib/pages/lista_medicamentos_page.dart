import 'package:cadastro_medicamento/utils/pallete.dart';
import 'package:flutter/material.dart';
import '../data/medicamento.dart';
import '../data/medicamentos_db.dart';
import '../form.dart';
import '../editForm.dart';
import 'dart:developer';

class ListaMedicamentos extends StatefulWidget {
  const ListaMedicamentos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaMedicamentosState();
  }
}

class ListaMedicamentosState extends State<ListaMedicamentos> {

  List<Medicamento> _medicamentos = List.filled(
      0, Medicamento('a', 'a', 1.0, 1, 'a', 'a', 'a', 'a', 'a'),
      growable: true);

  late String nome;
  late String descricao;
  late double quantidade;
  late int frequencia;
  late String tempo;    
  late String data;
  late String valueQ;
  late String valueF;
  late String tipo;

  void updateListView(){
    Future<List<Medicamento>> futureList = MedicamentosDB.instance.getMedicamentos();
    futureList.then((medicamentos) {
      setState(() {
        this._medicamentos = medicamentos;
      });
    });
    
  }

  void onAddMedicamento() {
    final Future future =
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const MyFormPage();
    }));
    future.then((medicamentoRecebido) async {
      if (medicamentoRecebido != null) {

        await MedicamentosDB.instance.inserirMedicamento(medicamentoRecebido);

        setState(() {updateListView();});
      }
    });  
  }

  @override
  Widget build(BuildContext context) {
    updateListView();
    return Scaffold(
      backgroundColor: Palette.blackToWhite[800],
      body: ListView.builder(
        itemCount: _medicamentos.length,
        itemBuilder: (context, indice) {
          final medicamento = _medicamentos[indice];
          return ItemMedicamento(medicamento, updateListView);
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

class ItemMedicamento extends StatefulWidget {
  final Medicamento _medicamento;
  Function updateListView;

  ItemMedicamento(this._medicamento, this.updateListView, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ItemMedicamentoState();
}

class ItemMedicamentoState extends State<ItemMedicamento> {
  

  void _deleteMedicamento(Medicamento medicamento) async {
    int result = await MedicamentosDB.instance.deleteMedicamento(medicamento);
    if (result != 0) {
      debugPrint('Medicamento deletado');
      widget.updateListView();
    }
  }

  void onUpdateMedicamento(Medicamento medicamento) {
    final Future future =
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyEditPage(medicamento);
    }));
    future.then((medicamentoRecebido) async {
      if (medicamentoRecebido != null) {

        int result = await MedicamentosDB.instance.updateMedicamento(medicamentoRecebido, medicamento);
        if (result != 0) {
          debugPrint('Medicamento atualizado');
          widget.updateListView();
        }
      }
    });  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Palette.pinkToWhite,
          child: ListTile(
            contentPadding:
                const EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 3),
            title: Text(widget._medicamento.nome.toString(),
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Palette.blackToWhite[300])),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            color: Colors.white),
                        children: <TextSpan>[
                      TextSpan(text: widget._medicamento.descricao.toString()),
                      TextSpan(
                          text: '\n${widget._medicamento.quantidade.toString()} '),
                      TextSpan(
                          text: widget._medicamento.valueQ.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                      TextSpan(
                          text:
                              '\n${widget._medicamento.frequencia.toString()} vez(es)'),
                      TextSpan(
                          text: '/${widget._medicamento.valueF.toString()}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(
                          text: '\nHorário: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: widget._medicamento.tempo.toString()),
                      TextSpan(
                        text: '\n${widget._medicamento.data.toString()}',
                      ),
                      TextSpan(
                          text: '\nTipo: ${widget._medicamento.tipo.toString()}\n'),
                    ])),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () {
                            onUpdateMedicamento(widget._medicamento);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Palette.blackToWhite[900]),
                          ),
                          child: const Text('EDITAR',
                              style: TextStyle(color: Color(0xffef6f86)))),
                      ElevatedButton(
                          onPressed: () {
                            _deleteMedicamento(widget._medicamento);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Palette.blackToWhite[900]),
                          ),
                          child: const Text('EXCLUIR',
                              style: TextStyle(color: Color(0xffef6f86)))),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

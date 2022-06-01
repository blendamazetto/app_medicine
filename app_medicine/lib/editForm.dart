import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:intl/intl.dart';
import 'utils/pallete.dart';
import 'utils/config.dart';
import 'data/medicamento.dart';

class MyEditPage extends StatefulWidget {
  final Medicamento _medicamento;

  const MyEditPage(this._medicamento, {Key? key}) : super(key: key);

  @override
  State<MyEditPage> createState() => _MyEditPageState();
}

class _MyEditPageState extends State<MyEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Palette.pinkToWhite,
        ),
        toolbarHeight: 100,
        title: RichText(
          textAlign: TextAlign.left,
          text: const TextSpan(
            text: 'Editar Medicamento',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'Montserrat',
                height: 1.5,
                color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                text: '\nMude as informações',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: MyCustomForm(widget._medicamento),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  final Medicamento _medicamento;
  const MyCustomForm(this._medicamento, {Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  TextEditingController timeinput = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController frequencyinput = TextEditingController();
  TextEditingController nameinput = TextEditingController();
  TextEditingController descinput = TextEditingController();
  TextEditingController quantinput = TextEditingController();

  @override
  void initState() {
    timeinput.text = widget._medicamento.tempo;
    dateinput.text = widget._medicamento.data;
    frequencyinput.text = widget._medicamento.frequencia.toString();
    nameinput.text = widget._medicamento.nome;
    descinput.text = widget._medicamento.descricao;
    quantinput.text = widget._medicamento.quantidade.toString();
    String tipoinput = widget._medicamento.tipo.toString();

    switch (tipoinput) {
      case "Em pó":
        indexTipo = 0;
        break;
      case "Gotas":
        indexTipo = 1;
        break;
      case "Injeção":
        indexTipo = 2;
        break;
      case "Líquido":
        indexTipo = 3;
        break;
      case "Pastilha":
        indexTipo = 4;
        break;
      case "Pílula":
        indexTipo = 5;
        break;
      case "Pomada":
        indexTipo = 6;
        break;
      case "Spray":
        indexTipo = 7;
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //MEDICINE NAME FIELD
        Container(
          padding:
              const EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
          height: 110,
          child: TextField(
            controller: nameinput,
            style: const TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(fontSize: 12),
              hintText: 'Insira o nome do medicamento',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                //color: Color(0xff666666)
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Nome\n\n',
              alignLabelWithHint: false,
              fillColor: Color(0xffe6e6e6),
              filled: true,
            ),
          ),
        ),

        //MEDICINE DESCRIPTION FIELD
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: TextField(
            controller: descinput,
            textAlignVertical: TextAlignVertical.top,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            maxLength: 150,
            style: const TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(fontSize: 12),
              hintText: 'Insira a descrição do medicamento',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                //color: Color(0xff666666)
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Descrição\n\n',
              alignLabelWithHint: false,
              fillColor: Color(0xffe6e6e6),
              filled: true,
              isDense: true,
            ),
          ),
        ),

        //CAROUSEL
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 28),
            child: const Text(
              'Tipo do Medicamento',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.5,
                color: Color(0xff666666),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 110.0,
            width: double.maxFinite,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  images[index],
                );
              },
              itemCount: images.length,
              index: indexTipo,
              pagination: const SwiperPagination(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
                  builder: DotSwiperPaginationBuilder(
                      color: Color(0xffe6e6e6),
                      activeColor: Color(0xffef6f86),
                      size: 10.0,
                      activeSize: 10.0)),
              duration: 500, 
              onTap: (index) {
                switch (index) {
                  case 0:
                    tipo = "Em pó";
                    break;
                  case 1:
                    tipo = "Gotas";
                    break;
                  case 2:
                    tipo = "Injeção";
                    break;
                  case 3:
                    tipo = "Líquido";
                    break;
                  case 4:
                    tipo = "Pastilha";
                    break;
                  case 5:
                    tipo = "Pílula";
                    break;
                  case 6:
                    tipo = "Pomada";
                    break;
                  case 7:
                    tipo = "Spray";
                    break;
                }
              },
              control: const SwiperControl(),
            ),
          ),
        ),

        //QUANTITY FIELD + DROPDOWN BUTTON
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(children: [
                    TextField(
                      controller: quantinput,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      style: const TextStyle(fontSize: 12),
                      decoration: const InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: TextStyle(fontSize: 12),
                        hintText: 'Insira a quantidade',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          //color: Color(0xff666666)
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: EdgeInsetsDirectional.only(start: 10),
                        labelText: 'Quantidade\n\n',
                        alignLabelWithHint: false,
                        fillColor: Color(0xffe6e6e6),
                        filled: true,
                      ),
                    ),
                  ]),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: const Color(0xffef6f86),
                          borderRadius: BorderRadius.circular(30)),
                      child: DropdownButton(
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: Color(0xffffffff),
                        ),
                        underline: Container(
                          height: 0,
                        ),
                        dropdownColor: Palette.pinkToWhite,
                        borderRadius: BorderRadius.circular(30),
                        isExpanded: true,
                        value: dropdownValueQ,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconEnabledColor: const Color(0xffffffff),
                        items: itemsQ.map((String itemsQ) {
                          return DropdownMenuItem(
                            value: itemsQ,
                            child: Center(child: Text(itemsQ)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueQ = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        //FREQUENCY FIELD + DROPDOWN BUTTON
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: IntrinsicHeight(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(children: [
                  TextField(
                    controller: frequencyinput,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    maxLength: 2,
                    style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        //color: Color(0xff666666),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Frequência\n\n',
                      hintStyle: TextStyle(fontSize: 12),
                      hintText: 'Insira a frequência',
                      contentPadding: EdgeInsetsDirectional.only(start: 10),
                      alignLabelWithHint: false,
                      fillColor: Color(0xffe6e6e6),
                      filled: true,
                    ),
                  ),
                ]),
              ),
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsetsDirectional.only(bottom: 10, start: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: const Color(0xffef6f86),
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton(
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: Color(0xffffffff),
                    ),
                    underline: Container(
                      height: 0,
                    ),
                    dropdownColor: Palette.pinkToWhite,
                    isExpanded: true,
                    value: dropdownValueF,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconEnabledColor: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(30),
                    items: itemsF.map((String itemsF) {
                      return DropdownMenuItem(
                        value: itemsF,
                        child: Center(child: Text(itemsF)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueF = newValue!;
                      });
                    },
                  ),
                ),
              )),
            ],
          )),
        ),

        //TIME AND DATE FIELDS
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(children: [
                    TextField(
                      controller: timeinput,
                      style: const TextStyle(fontSize: 12),
                      decoration: const InputDecoration(
                        labelText: "Horário\n\n",
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide.none,
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          //color: Color(0xff666666),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: TextStyle(fontSize: 12),
                        hintText: 'Insira o horário',
                        contentPadding: EdgeInsetsDirectional.only(start: 10),
                        alignLabelWithHint: false,
                        fillColor: Color(0xffe6e6e6),
                        filled: true,
                      ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                        );
                        if (pickedTime != null) {
                          DateTime parsedTime = DateFormat('HH:mm', 'pt_Br')
                              .parse(pickedTime.format(context).toString());
                          String formattedTime =
                              DateFormat('HH:mm', 'pt_Br').format(parsedTime);
                          setState(() {
                            timeinput.text = formattedTime;
                          });
                        }
                      },
                    )
                  ]),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10),
                      child: TextField(
                        style: const TextStyle(fontSize: 12),
                        controller:
                            dateinput, //editing controller of this TextField
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide.none,
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              //color: Color(0xff666666),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintStyle: TextStyle(fontSize: 12),
                            hintText: 'Insira a data',
                            contentPadding:
                                EdgeInsetsDirectional.only(start: 10),
                            alignLabelWithHint: false,
                            fillColor: Color(0xffe6e6e6),
                            filled: true,
                            labelText: "Data final\n\n"),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              locale: const Locale("pt", "BR"),
                              initialDate: DateTime.now(),
                              firstDate: DateTime
                                  .now(), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy', 'pt_Br')
                                    .format(pickedDate);
                            //DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br').format(pickedDate);
                            //DateFormat('dd-MM-yyyy').format(pickedDate);
                            setState(() {
                              dateinput.text = formattedDate;
                            });
                          }
                        },
                      )),
                ),
              ],
            ),
          ),
        ),

        //BUTTON ADD MEDICINE
        Padding(
            padding: const EdgeInsets.only(top: 9),
            child: ElevatedButton(
              child: const Text('Salvar lembrete'),
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  primary: const Color(0xffef6f86),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle:
                      const TextStyle(fontSize: 18, fontFamily: 'Montserrat')),
              onPressed: () => criaMedicamento(context),
            )),
      ],
    );
  }

  void criaMedicamento(BuildContext context) {
    final String nome = nameinput.text;
    final String descricao = descinput.text;
    final double? quantidade = double.tryParse(quantinput.text);
    final int? frequencia = int.tryParse(frequencyinput.text);
    final String tempo = timeinput.text;
    final String data = dateinput.text;
    final String valueQ = dropdownValueQ;
    final String valueF = dropdownValueF;
    switch (tipo) {
      case "Em pó":
        indexTipo = 0;
        break;
      case "Gotas":
        indexTipo = 1;
        break;
      case "Injeção":
        indexTipo = 2;
        break;
      case "Líquido":
        indexTipo = 3;
        break;
      case "Pastilha":
        indexTipo = 4;
        break;
      case "Pílula":
        indexTipo = 5;
        break;
      case "Pomada":
        indexTipo = 6;
        break;
      case "Spray":
        indexTipo = 7;
        break;
    }
    if (nome != "" &&
        descricao != "" &&
        quantidade != null &&
        frequencia != null &&
        tempo != "" &&
        data != "" &&
        tipo != "" &&
        indexTipo != -1) {
      final medicamentoCriado = Medicamento(nome, descricao, quantidade,
          frequencia, tempo, data, valueQ, valueF, tipo);
      Navigator.pop(context, medicamentoCriado);
    }
  }
}

//indexTipo vai ser utilizado para mostrar em qual item do carrossel tem que mostrar primeiro quando for editar o medicamento
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:intl/intl.dart';
import 'utils/pallete.dart';
import 'data/medicamento.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key}) : super(key: key);

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Palette.pinkToWhite,
        ),
        toolbarHeight: 140,
        title: RichText(
          textAlign: TextAlign.left,
          text: const TextSpan(
            text: 'Add New Medicine',
            style: TextStyle(
                fontSize: 26,
                fontFamily: 'Montserrat',
                height: 1.5,
                color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                text: '\nAnd set the infos',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: const MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

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
    timeinput.text = "";
    dateinput.text = "";
    frequencyinput.text = "1";
    nameinput.text = "";
    descinput.text = "";
    quantinput.text = "";
    super.initState();
  }

  String dropdownValueQ = 'Item 1';
  var itemsQ = ['mg', 'ml', 'Item 3'];

  String dropdownValueF = 'Item 1';
  var itemsF = ['Item 1', 'Item 2', 'Item3'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //MEDICINE NAME FIELD
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 38),
          child: TextField(
            controller: nameinput,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(fontSize: 14),
              hintText: 'Enter medicine name',
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xff666666)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Medicine Name\n\n',
              alignLabelWithHint: false,
              fillColor: Color(0xffe6e6e6),
              filled: true,
            ),
          ),
        ),

        //MEDICINE DESCRIPTION FIELD
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: TextField(
            controller: descinput,
            textAlignVertical: TextAlignVertical.top,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            maxLength: 300,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsetsDirectional.only(bottom: 0, start: 10, top: 50),
              hintStyle: TextStyle(fontSize: 14),
              hintText: 'Enter medicine description',
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xff666666)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Description\n\n',
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
            margin: const EdgeInsets.only(left: 30, right: 20.0),
            child: const Text(
              'Medicine Type',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff666666),
                  fontSize: 10.5),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: SizedBox(
            height: 130.0,
            width: double.maxFinite,
            child: Carousel(
              images: const [
                NetworkImage(
                    'https://images.unsplash.com/photo-1573883429746-084be9b5cfca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGlsbHN8ZW58MHx8MHx8&w=1000&q=80'),
                NetworkImage(
                    'https://images.unsplash.com/photo-1573883429746-084be9b5cfca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGlsbHN8ZW58MHx8MHx8&w=1000&q=80'),
                ExactAssetImage("assets/images/LaunchImage.jpg")
              ],
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Palette.blackToWhite.shade900,
              indicatorBgPadding: 5.0,
              dotBgColor: Palette.pinkToWhite,
              borderRadius: true,
              autoplay: false,
              //radius: const Radius.circular(30),
            ),
          ),
        ),

        //QUANTITY FIELD + DROPDOWN BUTTON

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(children: [
                    TextField(
                      controller: quantinput,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 4,
                      decoration: const InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: TextStyle(fontSize: 14),
                        hintText: 'Enter quantity',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xff666666)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: EdgeInsetsDirectional.only(
                            bottom: 10, start: 10, top: 0, end: 0),
                        labelText: 'Quantity\n\n',
                        alignLabelWithHint: false,
                        fillColor: Color(0xffe6e6e6),
                        filled: true,
                      ),
                    ),
                  ]),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        bottom: 10, start: 10, top: 0, end: 0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: const Color(0xffef6f86),
                          borderRadius: BorderRadius.circular(30)),
                      child: DropdownButton(
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xff666666),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Frequency\n\n',
                      hintStyle: TextStyle(fontSize: 14),
                      hintText: 'Enter frequency',
                      contentPadding: EdgeInsetsDirectional.only(
                          bottom: 10, start: 10, top: 0, end: 0),
                      alignLabelWithHint: false,
                      fillColor: Color(0xffe6e6e6),
                      filled: true,
                    ),
                  ),
                ]),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 5, right: 20),
                  child: const Text(
                    'times',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff666666),
                        fontSize: 14),
                  ),
                ),
              ),
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: const Color(0xffef6f86),
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton(
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
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
              ),
            ],
          )),
        ),

        //TIME AND DATE FIELDS

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(children: [
                    TextField(
                      controller: timeinput,
                      decoration: const InputDecoration(
                        labelText: "Time\n\n",
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide.none,
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xff666666),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: TextStyle(fontSize: 14),
                        hintText: 'Enter time',
                        contentPadding: EdgeInsetsDirectional.only(
                            bottom: 10, start: 10, top: 0, end: 0),
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
                        );
                        if (pickedTime != null) {
                          DateTime parsedTime = DateFormat.jm()
                              .parse(pickedTime.format(context).toString());
                          String formattedTime =
                              DateFormat('HH:mm:ss').format(parsedTime);
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
                      padding: const EdgeInsetsDirectional.only(
                          bottom: 10, start: 10, top: 0, end: 0),
                      child: TextField(
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
                              color: Color(0xff666666),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintStyle: TextStyle(fontSize: 14),
                            hintText: 'Enter date',
                            contentPadding: EdgeInsetsDirectional.only(
                                bottom: 10, start: 10, top: 0, end: 0),
                            alignLabelWithHint: false,
                            fillColor: Color(0xffe6e6e6),
                            filled: true,
                            labelText: "Date\n\n"),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
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
            padding: const EdgeInsetsDirectional.only(
                start: 10, top: 0, end: 10, bottom: 10),
            child: ElevatedButton(
              child: const Text('Add New Medicine'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: const Color(0xffef6f86),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle:
                      const TextStyle(fontSize: 16, fontFamily: 'Montserrat')),
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

    if (nome != "" &&
        descricao != "" &&
        quantidade != null &&
        frequencia != null &&
        tempo != "" &&
        data != "") {
      final medicamentoCriado =
          Medicamento(nome, descricao, quantidade, frequencia, tempo, data);
      Navigator.pop(context, medicamentoCriado);
    }
  }
}

import 'package:cadastro_medicamento/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:action_slider/action_slider.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: const CustomAlarm(),
    );
  }
}

class CustomAlarm extends StatefulWidget {
  const CustomAlarm({Key? key}) : super(key: key);

  @override
  State<CustomAlarm> createState() => _CustomAlarmState();
}

class _CustomAlarmState extends State<CustomAlarm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 50),
            child: const Icon(
              Icons.alarm,
              color: Color(0xffef6f86),
              size: 140,
            )),
        Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Lembrete",
                    style: TextStyle(
                        color: Palette.pinkToWhite,
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                Text("9:30",
                    style: TextStyle(
                        color: Palette.blackToWhite.shade700,
                        fontFamily: 'Montserrat',
                        fontSize: 64)),
                Text("Terça-feira, 11 de setembro de 2022",
                    style: TextStyle(
                        color: Palette.blackToWhite.shade700,
                        fontFamily: 'Montserrat',
                        fontSize: 16)),
              ],
            )),
        Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Amoxicilina",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Palette.pinkToWhite,
                        fontFamily: 'Montserrat',
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                Text("25 ml, 2 vezes ao dia",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Palette.pinkToWhite,
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            )),
        Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              child: ActionSlider.standard(
                backgroundColor: Palette.blackToWhite.shade800,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.transparent,
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: Offset(0, 0))
                ],
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                width: 200,
                child: Text(
                  'Desligar',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Palette.pinkToWhite,
                      fontWeight: FontWeight.w600),
                ),
                onSlide: (controller) async {
                  fechaNavegacao();
                  await Future.delayed(const Duration(seconds: 3));
                },
              ),
            ))
      ],
    );
  }

  void fechaNavegacao() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }
}

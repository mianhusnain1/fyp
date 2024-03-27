import 'package:doctor/Screens/widgets.dart';
import 'package:doctor/main.dart';
import 'package:flutter/material.dart';


class Done extends StatefulWidget {
  const Done(
      {super.key,
      required this.msg,
      required this.ontap1,
      required this.btnmsg});
  final String msg;
  final String btnmsg;
  final VoidCallback ontap1;
  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  late Size mq;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: ListView(children: [
        Column(
          children: [
            const SizedBox(
              child: MainTop(),
            ),
            SizedBox(
              height: mq.height * 0.15,
              child: Image.asset("images/doctor.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: mq.height * 0.1,
              child: Image.asset("images/ok.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: mq.width - 80,
              child: Text(
                widget.msg,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: mq.width - 80,
              child: InkWell(
                onTap: widget.ontap1,
                child: Container(
                  height: mq.height * 0.065,
                  width: mq.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: myColor,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(1, 1))
                      ]),
                  child: Center(
                    child: Text(
                      widget.btnmsg,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    ));
  }
}

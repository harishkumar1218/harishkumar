import 'package:admeme/pages/date.dart';
import 'package:flutter/material.dart';

class MsgCard extends StatefulWidget {
  const MsgCard({super.key, required this.msg});

  final Map<String, dynamic> msg;

  @override
  State<MsgCard> createState() => _MsgCardState();
}

class _MsgCardState extends State<MsgCard> {
  @override
  Widget build(BuildContext context) {
    print(widget.msg['user'].runtimeType);
    if (widget.msg['user']!) {
      return _greenmsg();
    } else {
      return _bluemsg();
    }
  }

  Widget _bluemsg() {
    return Row(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 300),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * .04),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01,
              vertical: MediaQuery.of(context).size.height * 0.001),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Column(
            children: [
              Text(
                "${widget.msg['msg']}",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, bottom: 0),
                child: Text(
                  dateutil.getdateformatted(
                      context: context, time: widget.msg['sent']),
                  style: const TextStyle(fontSize: 9, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _greenmsg() {
    return Row(
      children: [
        Expanded(child: Container()),
        Container(
          constraints: BoxConstraints(maxWidth: 300),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * .04),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01,
              vertical: MediaQuery.of(context).size.height * 0.001),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Column(
            children: [
              Text(
                "${widget.msg['msg']}",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, bottom: 0),
                child: Text(
                  dateutil.getdateformatted(
                      context: context, time: widget.msg['sent']),
                  style: const TextStyle(fontSize: 9, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

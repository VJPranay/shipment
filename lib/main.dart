import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() => runApp(_CreateShipment());

class _CreateShipment extends StatefulWidget {
  @override
  _CreateShipmentState createState() => _CreateShipmentState();
}

class _CreateShipmentState extends State<_CreateShipment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Center(child: new Icon(Icons.important_devices)),
          leading: new Icon(Icons.reorder),
          actions: <Widget>[
            Icon(Icons.account_circle),
            Icon(Icons.keyboard_arrow_down)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _Heading(
                  heading: "Create Shipment",
                  subHeading: "Step 1 of 6 - Shipper"),
              _ProcessIndicator(),
              textInfo(),
              _TitleTextInput(
                  title: "Shipper", hint: "Company Name", asterisk: true),
              _TitleTextInput(
                  title: "Location", hint: "Address", asterisk: true),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: _TitleTextInput(
                    title: "BOL #", hint: "Optional", asterisk: false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding textInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
          text: TextSpan(
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              children: <TextSpan>[
            TextSpan(
              text: "*",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            TextSpan(text: "Indicates Requried Field")
          ])),
    );
  }
}

class _Heading extends StatelessWidget {
  final String heading, subHeading;

  _Heading({@required this.heading, @required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 17, bottom: 17, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: Text(
                  this.heading,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300),
                ),
              ),
              Text(
                this.subHeading,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProcessIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14.0),
              child: Divider(
                height: 32.0,
                color: Colors.grey[400],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400], // border color
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 13,
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  OutlinedBubble(text: "2"),
                  OutlinedBubble(text: "3"),
                  OutlinedBubble(text: "4"),
                  OutlinedBubble(text: "5"),
                  OutlinedBubble(text: "6"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OutlinedBubble extends StatelessWidget {
  final String text;

  OutlinedBubble({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400], // border color
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(1.2),
      child: CircleAvatar(
        radius: 13,
        child: Text(
          this.text,
          style: TextStyle(
            color: Colors.grey[400],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class _TitleTextInput extends StatelessWidget {
  final String title, hint;
  final bool asterisk;
  var req;

  _TitleTextInput(
      {@required this.title, @required this.hint, @required this.asterisk});

  @override
  Widget build(BuildContext context) {
    if (asterisk == true) {
      req = Padding(
        padding: const EdgeInsets.only(right: 23, top: 5),
        child: Align(
            alignment: Alignment.topRight,
            child: Text(
              "*",
              style: TextStyle(color: Colors.red, fontSize: 18),
            )),
      );
    } else {
      req = Container(color: Colors.white // This is optional
          );
    }
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.grey[200]),
                    // border color
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.1),
                    child: Text(title),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.grey[200]),
                    // border color
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration.collapsed(
                        hintText: hint,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        req,
      ],
    );
  }
}

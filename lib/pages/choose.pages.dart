import 'package:flutter/material.dart';



class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "/AR");
        },
      ),
    );
  }
}
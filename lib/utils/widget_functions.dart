import 'package:flutter/material.dart';

showSingleTextInputDialog({
  required BuildContext context,
  required String title,
  String posBtntxt = 'OK',
  String negBtntxt = 'CLOSE',
  required Function(String) onSubmit
}) {
  final _controller = TextEditingController();
  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(title),

    content: Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(
          labelText: title
        ),
      ),
    ),

    actions: [
      TextButton(
        child: Text(negBtntxt),
        onPressed: () => Navigator.of(context).pop(),
      ),
      TextButton(
        child: Text(posBtntxt),
        onPressed: () {
          if(_controller.text.isEmpty) return;
          onSubmit(_controller.text);
          Navigator.of(context).pop();
        },
      )
    ]
  ));
}

showMsg(BuildContext context, String msg) =>
  ScaffoldMessenger
    .of(context)
    .showSnackBar(SnackBar(content: Text(msg)));
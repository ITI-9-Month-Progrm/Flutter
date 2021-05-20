import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

Widget showCustomDialog(BuildContext context) {
  return  MaterialButton(
    minWidth: 300,
    color: Colors.grey[300],
    onPressed: () => Dialogs.materialDialog(
      color: Colors.white,
      msg: 'User Added',
      title: 'Congratulations',
      animation: 'assets/cong_example.json',
      context: context,
      actions: [
        IconsButton(
          onPressed: () {Navigator.pushNamed(context, "/");},
          text: 'Claim',
          iconData: Icons.done,
          color: Colors.blue,
          textStyle: TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    ),
    child: Text("Show animations Material Dialog"),
  );
}

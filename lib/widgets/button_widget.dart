import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool active;

  const ButtonWidget({
    required this.text,
    required this.onTap,
    required this.active,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: MediaQuery.of(context).size.width / 3.5,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: active ? const Color(0xff5ED5A8) : const Color(0xff777777),
            boxShadow: [
              BoxShadow(
                color: active
                    ? const Color(0xff5ED5A8).withOpacity(.15)
                    : Colors.transparent,
                offset: const Offset(0, 10),
                blurRadius: 20,
                spreadRadius: 0,
              )
            ]),
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(color: active ? Colors.black : Colors.white54),
          ),
          onPressed: onTap,
        ));
  }
}

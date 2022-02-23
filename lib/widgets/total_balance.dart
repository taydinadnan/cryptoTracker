import 'package:flutter/material.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total balance",
                style: TextStyle(
                    color: Colors.white.withOpacity(.55), fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "\$99.54",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.add_card_sharp,
              color: Colors.grey,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

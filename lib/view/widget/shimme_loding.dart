import 'package:flutter/material.dart';

class ShimmeLoding extends StatelessWidget {
  const ShimmeLoding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 80,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/img/5.jpg'),
                backgroundColor: Colors.green,
                maxRadius: 30,
              ),
              Text(
                '5456456',
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

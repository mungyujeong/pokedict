import 'package:flutter/material.dart';

class PokeInfo extends StatelessWidget {
  final int? id;
  final String? name;

  const PokeInfo({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            Text(
              "#${id.toString().padLeft(3, '0')}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                name!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.8),
                ),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

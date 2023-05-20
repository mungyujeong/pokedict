import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TypeContainer extends StatelessWidget {
  final String? type;
  final Color? typeColor;
  final String iconPath;

  const TypeContainer({
    Key? key,
    required this.type,
    required this.typeColor,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          color: typeColor!.withOpacity(1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 25,
              color: Colors.white.withOpacity(.5),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(type!.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}

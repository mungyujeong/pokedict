import 'package:flutter/material.dart';

PreferredSizeWidget mainAppBar() {
  final btnNames = <String>['ALL GAME VERSIONS', 'ALL GENS', 'ALL TYPES'];

  return AppBar(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 3,
    title: const Text(
      "Pokemon Center",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.menu_outlined),
    ),
    actions: [
      Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star_border_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check_circle_outline_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      )
    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterButton(name: btnNames[0]),
                  VerticalDivider(
                    thickness: 1,
                    width: .5,
                    color: Colors.grey.withOpacity(.3),
                  ),
                  FilterButton(name: btnNames[1]),
                  VerticalDivider(
                    thickness: 1,
                    width: .5,
                    color: Colors.grey.withOpacity(.3),
                  ),
                  FilterButton(name: btnNames[2]),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}

class FilterButton extends StatelessWidget {
  late String name;

  FilterButton({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokecenter/component/filter_button.dart';
import 'package:pokecenter/screens/star_screen.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final AppBar appBar;
  bool isStared;
  bool isCircled;
  MainAppBar({
    super.key,
    required this.appBar,
    required this.isStared,
    required this.isCircled,
  });

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(110);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
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
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  widget.isStared = !widget.isStared;
                });
                if (widget.isStared == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StarScreen(
                        isCircled: widget.isCircled,
                        isStared: widget.isStared,
                      ),
                    ),
                  );
                }
              },
              icon: widget.isStared
                  ? const Icon(
                      Icons.stars,
                      color: Colors.amber,
                    )
                  : Icon(
                      Icons.stars,
                      color: Colors.black.withOpacity(.6),
                    ),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.isCircled = !widget.isCircled;
                });
              },
              icon: widget.isCircled
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.check_circle,
                      color: Colors.black.withOpacity(.6),
                    ),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
              iconSize: 30,
            ),
          ],
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterButton(
                      name: btnNames[0],
                      flex: 2,
                    ),
                    VerticalDivider(
                      thickness: 1,
                      width: 10,
                      color: Colors.grey.withOpacity(.3),
                    ),
                    FilterButton(
                      name: btnNames[1],
                      flex: 1,
                    ),
                    VerticalDivider(
                      thickness: 1,
                      width: 10,
                      color: Colors.grey.withOpacity(.3),
                    ),
                    FilterButton(
                      name: btnNames[2],
                      flex: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokeButton extends StatefulWidget {
  final String? name;
  const PokeButton({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<PokeButton> createState() => _PokeButtonState();
}

class _PokeButtonState extends State<PokeButton> {
  bool isStared = false;
  bool isCircled = false;

  late SharedPreferences prefs;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final staredPokemons = prefs.getStringList('staredPokemon');
    final circledPokemons = prefs.getStringList('circledPokemon');

    if (staredPokemons != null) {
      if (staredPokemons.contains(widget.name) == true) {
        setState(() {
          isStared = true;
        });
      }
    } else {
      await prefs.setStringList('staredPokemon', []);
    }

    if (circledPokemons != null) {
      if (circledPokemons.contains(widget.name) == true) {
        setState(() {
          isCircled = true;
        });
      }
    } else {
      await prefs.setStringList('circledPokemon', []);
    }
  }

  onStarTap() async {
    final staredPokemons = prefs.getStringList('staredPokemon');
    if (staredPokemons != null) {
      if (isStared) {
        staredPokemons.remove(widget.name);
      } else {
        staredPokemons.add(widget.name!);
      }
      await prefs.setStringList('staredPokemon', staredPokemons);
      setState(() {
        isStared = !isStared;
      });
    }
    print("star: $staredPokemons");
  }

  onCircleTap() async {
    final circledPokemons = prefs.getStringList('circledPokemon');
    if (circledPokemons != null) {
      if (isCircled) {
        circledPokemons.remove(widget.name);
      } else {
        circledPokemons.add(widget.name!);
      }
      await prefs.setStringList('circledPokemon', circledPokemons);
      setState(() {
        isCircled = !isCircled;
      });
    }
    print("circle: $circledPokemons");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: onStarTap,
            icon: isStared
                ? Icon(
                    Icons.star,
                    color: Colors.black.withOpacity(.6),
                  )
                : Icon(Icons.star_border_outlined,
                    color: Colors.black.withOpacity(.6)),
            iconSize: 30,
          ),
          const SizedBox(width: 10),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: onCircleTap,
            icon: isCircled
                ? Icon(Icons.check_circle, color: Colors.black.withOpacity(.6))
                : Icon(Icons.circle_outlined,
                    color: Colors.black.withOpacity(.6)),
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}

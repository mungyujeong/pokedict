class Strong {
  final double strengthLevel = 1500.99;
}

class QuickRunner {
  void runQuick() {
    print('ruuuuuuuuuuun');
  }
}

class Tall {
  final double height = 1.99;
}

enum Team { blue, red }

class Player with Strong, QuickRunner, Tall {
  final Team team;

  Player({
    required this.team,
    required String name,
  });
}

class Horse with Strong, QuickRunner {}

class Kid with QuickRunner {}

void main(List<String> args) {
  var player = Player(team: Team.red, name: 'nico');
  player.runQuick();
}

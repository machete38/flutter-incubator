/// Object equipable by a [Character].
class Item {
  String name;

  int defense = 0;
  int damage = 0;

  bool torsoEquippable = false;
  bool shoesEquippable = false;
  bool legsEquippable = false;
  bool headEquippable = false;
  bool leftHandEquippable = false;
  bool rightHandEquippable = false;

  Item(this.name);
}

/// Entity equipping [Item]s.
class Character {
  Item? leftHand;
  Item? rightHand;
  Item? hat;
  Item? torso;
  Item? legs;
  Item? shoes;

  /// Returns all the [Item]s equipped by this [Character].
  Iterable<Item> get equipped =>
      [leftHand, rightHand, hat, torso, legs, shoes].whereType<Item>();

  /// Returns the total damage of this [Character].
  int get damage {
    int damage = 0;
    equipped.forEach((element) {
      damage += element.damage;
    });
    return damage;
  }

  /// Returns the total defense of this [Character].
  int get defense {
    int defense = 0;
    equipped.forEach((element) {
      defense += element.defense;
    });
    return defense;
  }

  /// Equips the provided [item], meaning putting it to the corresponding slot.
  ///
  /// If there's already a slot occupied, then throws a [OverflowException].
  void equip(Item item) {
    if (item.rightHandEquippable && rightHand == null) {
      rightHand = item;
      printEq(item, 'in your right hand');
    } else if (item.leftHandEquippable && leftHand == null) {
      leftHand = item;
      printEq(item, 'in your left hand');
    } else if (item.headEquippable && hat == null) {
      hat = item;
      printEq(item, 'on your head');
    } else if (item.legsEquippable && legs == null) {
      legs = item;
      printEq(item, 'on your legs');
    } else if (item.torsoEquippable && torso == null) {
      torso = item;
      printEq(item, 'on your torso');
    } else if (item.shoesEquippable && shoes == null) {
      shoes = item;
      printEq(item, 'on your shoes');
    } else {
      throw OverflowException();
    }
  }

  void printEq(Item item, String where) {
    print(
        '\n\n${item.name} is succesfully equipped $where\n Total damage: $damage\n Total defense: $defense\n');
  }
}

/// [Exception] indicating there's no place left in the [Character]'s slot.
class OverflowException implements Exception {}

void main() {
  Character ch = Character();
  Sword sword = Sword('Eternal Blade');
  Shield shield = Shield('Barricader');
  print('Is ${sword.name} an armor? ${sword.isArmor()}');
  print('Is ${shield.name} an armor? ${shield.isArmor()}');
  ch.equip(sword);
  ch.equip(shield);
}

class Sword extends Item with Weapon {
  Sword(super.name) {
    super.damage = 150;
    super.leftHandEquippable = true;
    super.rightHandEquippable = true;
  }
}

class BodyArmor extends Item with Armor {
  BodyArmor(super.name) {
    super.defense = 50;
    super.torsoEquippable = true;
  }
}

class Shield extends Item with Armor {
  Shield(super.name) {
    super.leftHandEquippable = true;
    super.rightHandEquippable = true;
    super.defense = 40;
  }
}

class LegArmor extends Item with Armor {
  LegArmor(super.name) {
    super.legsEquippable = true;
    super.defense = 20;
  }
}

class Helmet extends Item with Armor {
  Helmet(super.name) {
    super.headEquippable = true;
    super.defense = 30;
  }
}

class Sabaton extends Item with Armor {
  Sabaton(super.name) {
    super.shoesEquippable = true;
    super.defense = 10;
  }
}

mixin Weapon {
  bool isArmor() {
    return false;
  }

  bool isWeapon() {
    return true;
  }
}
mixin Armor {
  bool isWeapon() {
    return false;
  }

  bool isArmor() {
    return true;
  }
}

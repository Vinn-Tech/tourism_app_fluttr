class Animal {
  // constructor
  Animal(this.name, this.age, this.weight);
  Animal.name(this.name);
  Animal.age(this.age);

  // attribute
  String name = "hewan";
  int age = 0;
  double weight = 0.5;

  // behaviour
  void sleep() {
    age = age + 1;
  }

  void eat() {
    weight = weight + 1.5;
  }

  void poop() {
    weight = weight - 0.5;
  }
}

void main() {
  // object dog
  final dog = Animal("Doug", 2, 3.5);

  // access object
  print(dog.name);
  print(dog.weight);

  dog.eat();

  print(dog.weight);

  final cat = Animal.name("Kitty");
  print(cat.name);
  print(cat.age);
  print(cat.weight);
}

class MyModel {
  String someValue = "Hello Value";
  MyModel({this.someValue});

  Future<void> doSomething() async {
    await Future.delayed(Duration(seconds: 2), () {
      someValue = "SomeValue";
      print(someValue);
    });
  }
}

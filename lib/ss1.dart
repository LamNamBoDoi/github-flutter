Future<void> asyncFunc() {
  return Future.delayed(Duration(seconds: 2), (() => print('Hello Future')));
}

main() {
  asyncFunc();

  print('waiting');
}

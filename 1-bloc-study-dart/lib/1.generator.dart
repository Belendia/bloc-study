// this is an async generator function. That is why it is marked with async*
Stream<int> boatStream() async* {
  for (int i = 0; i <= 10; i++) {
    print("SENT boat no. " + i.toString());
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main(List<String> args) async {
  Stream<int> stream = boatStream();
  stream.listen((receivedData) {
    print("RECEIVED boat no. " + receivedData.toString());
  });
}

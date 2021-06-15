import 'dart:async';

// create class
class SignInBloc {
  final StreamController<bool> _isLoadingController = StreamController<bool>();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

//close the controller when the sign in page is removed from the widget tree
  void dispose() {
    _isLoadingController.close();
  }

  // method to add values to the stream
  void setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);
}
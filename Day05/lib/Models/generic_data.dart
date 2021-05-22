class GeneralState<T>{
  T data;
  String error;
  bool hasData, hasError, waiting;
  GeneralState({
    this.data,
    this.error,
    this.hasData = false,
    this.hasError = false,
    this.waiting = false
  });
}



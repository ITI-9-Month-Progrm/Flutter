class HttpError {
   String error;
   HttpError({this.error});
   HttpError.fromJson(Map json) {
      this.error = json['error'];
   }
}

class ReaponseModel {
  bool _isSuccess;
  String _message;

  ReaponseModel(this. _isSuccess, this._message);

  String? get message =>_message;
  bool? get isSuccess =>_isSuccess;
}

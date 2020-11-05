class PopupState {
  final String title;
  final String message;
  final String titleButton1;
  final String titleButton2;

  PopupState({this.title, this.message, this.titleButton1, this.titleButton2});

  factory PopupState.initial (){
    return PopupState(
        title: '',
        message: '',
        titleButton1: 'Yes',
        titleButton2: 'No',
    );
  }

  PopupState copyWith({String title, String message, String titleButton1, String titleButton2}){
    return PopupState(
      title: title ?? this.title,
      message: message ?? this.message,
      titleButton1: titleButton1 ?? this.titleButton1,
      titleButton2: titleButton2 ?? this.titleButton2,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PopupState &&
              runtimeType == other.runtimeType &&
              title == other.title &&
              message == other.message &&
              titleButton1 == other.titleButton1 &&
              titleButton2 == other.titleButton2;

  @override
  int get hashCode =>
      title.hashCode ^
      message.hashCode ^
      titleButton1.hashCode ^
      titleButton2.hashCode;



}
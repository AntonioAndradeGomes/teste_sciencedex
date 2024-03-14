import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  final String? username;
  final String? pathImage;

  const UserState({
    this.username,
    this.pathImage,
  });

  @override
  List<Object?> get props => [
        username,
        pathImage,
      ];
}

class LoadingUser extends UserState {}

class DoneUser extends UserState {
  const DoneUser({
    super.username,
    super.pathImage,
  });

  DoneUser copyWith({
    String? username,
    String? pathImage,
  }) {
    return DoneUser(
      username: username ?? this.username,
      pathImage: pathImage ?? this.pathImage,
    );
  }
}

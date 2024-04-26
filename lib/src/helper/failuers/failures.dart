class Failuer {
  String? errorMessage;
  Failuer({required this.errorMessage});
}

class ServerFailuer extends Failuer {
  ServerFailuer({required super.errorMessage});
}

class NetworkFailuer extends Failuer {
  NetworkFailuer({required super.errorMessage});
}

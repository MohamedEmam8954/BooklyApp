import 'package:dio/dio.dart';


class Failures {
  final String errormessages;

  Failures({required this.errormessages});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errormessages});
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errormessages: "connectionTimeOut With Api Server");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errormessages: "SendTimeOut With Api Server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errormessages: "ReceiveTimeOut With Api Server");
      case DioExceptionType.badCertificate:
        return ServerFailure(errormessages: "there is an error,try later!");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
  return  ServerFailure(
            errormessages: "Request With Api Server was Canceld");
      case DioExceptionType.connectionError:
      return ServerFailure(errormessages: "No Internet Connection");
      case DioExceptionType.unknown:
         if (dioError.message!.contains("SocketExeception")) {
          return ServerFailure(errormessages: "No Internet Connection");
        }
        return ServerFailure(
            errormessages: "UnExecpted Error Please Try Again !");
        default:
        return ServerFailure(
            errormessages: "OOps There was an Error Try Later!");
    }
  }
  factory ServerFailure.fromResponse(int status, dynamic response) {
    if (status == 400 || status == 401 || status == 403) {
      return ServerFailure(errormessages: response["error"]["message"]);
    } else if (status == 404) {
      return ServerFailure(
          errormessages: "Your Requuest Not Found ,try Again Later");
    } else if (status == 500) {
      return ServerFailure(
          errormessages: "Interial Server Error,Please try Later");
    } else {
      return ServerFailure(errormessages: "OOps There was an Error Try Later!");
    }
  }
}

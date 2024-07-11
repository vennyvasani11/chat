import 'dart:convert';
import 'package:fitness/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../router/app_router.dart';
import '../utils/prefutils.dart';
import 'failure.dart';

class ApiProvider {

  Future<String> getApiCall(String url, Map<String, String>? headers) async {
    var responseJson = '';
    debugPrint("url===>${url}");

    if (await AppUtils.isConnected()) {
      try {
        final response = await http
            .get(Uri.parse(url), headers: headers)
            .timeout(Duration(seconds: 60));
        debugPrint("response====>${response.body}");

        responseJson = response.body;
      } catch (e) {}
    } else {
      AppUtils.toastMessage("Please check your internet!!");
    }
    return responseJson;
  }

  Future<String> postApiCall(
      String url, Object body, Map<String, String>? headers) async {
    var responseJson = '';

    if (await AppUtils.isConnected()) {
      try {
        debugPrint("url===>${url}");

        debugPrint("body==>${body}");

        http.Response response = await http
            .post(Uri.parse(url), headers: headers, body: body)
            .timeout(Duration(minutes: 1), onTimeout: () {
          // Time has run out, do what you wanted to do.
          print("408===>");
          return http.Response("", 408); // Request Timeout response status code
        });
        debugPrint("Response==>${response.body}");

        // var repos = response.bodyBytes.toString();

        responseJson = response.body;
        // _response(response);
      } catch (e) {
        responseJson = e.toString();
      }
    } else {
      AppUtils.toastMessage("Please check your internet!!");
    }
    return responseJson;
  }

  Future<String> putApiCall(
      String url, Object body, Map<String, String>? headers) async {
    var responseJson = '';
    debugPrint("url==>${url}");

    if (await AppUtils.isConnected()) {
      try {
        debugPrint("body==>${body}");

        http.Response response = await http
            .put(Uri.parse(url), headers: headers, body: body)
            .timeout(Duration(minutes: 1), onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response(
              ({
                {
                  "success": false,
                  "statusCode": 408,
                  "message": "Please try after sometime"
                }
              }).toString(),
              408); // Request Timeout response status code
        });
        // var repos = response.bodyBytes.toString();

        responseJson = response.body;
        // _response(response);
        debugPrint("response====>${response.body}");
      } catch (e) {}
    } else {
      AppUtils.toastMessage("Please check your internet!!");
    }
    return responseJson;
  }

  Future<String> deleteApiCall(
      String url, Object body, Map<String, String>? headers) async {
    var responseJson = '';
    debugPrint("url==>${url}");

    if (await AppUtils.isConnected()) {
      try {
        debugPrint("body==>${body}");

        http.Response response = await http
            .delete(Uri.parse(url), headers: headers, body: body)
            .timeout(Duration(minutes: 1), onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response(
              jsonEncode({
                {
                  "success": false,
                  "statusCode": 408,
                  "message": "Please try after sometime"
                }
              }),
              408); // Request Timeout response status code
        });
        // var repos = response.bodyBytes.toString();

        responseJson = response.body;
        // _response(response);
        debugPrint("response====>${response.body}");
      } catch (e) {}
    } else {
      AppUtils.toastMessage("Please check your internet!!");
    }
    return responseJson;
  }

  Future<String> postFormDataApiCall(http.MultipartRequest request) async {
    var responseJson;

    if (await AppUtils.isConnected()) {
      try {
        var response = await request.send().timeout(Duration(seconds: 60));
        var repos = response.stream.bytesToString();

        responseJson = repos;
        // _response(response);
        debugPrint("response====>${repos}");
      } catch (e) {}
    } else {
      AppUtils.toastMessage("Please check your internet!!");
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 201:
        var responseJson = response.body;
        return responseJson;
      case 400:
        var responseJson = response.body;
        return responseJson;
      // case 401:
      //   throw UnauthorisedException(response.body.toString());
      // case 403:
      //   throw UnauthorisedException(response.body.toString());
      // case 404:
      //   throw NotFoundException(response.body.toString());
      // case 408:
      //   throw RequestTimeoutException(response.body.toString());
      // case 501:
      //   throw NotImplementedException(response.body.toString());
      // case 502:
      //   throw BadGatewayException(response.body.toString());
      // case 503:
      //   throw ServiceUnavailableException(response.body.toString());
      // case 504:
      //   throw GatewayTimeoutException(response.body.toString());
      // case 500:
      // default:
      //   throw FetchDataException(
      //       'Please try after sometime occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

errorHandle(int status, String message, BuildContext context) {
  debugPrint("${status}==>${message}");

  if (status == 400) {
    AppUtils.toastMessage(message ?? '');
  } else if (status == 401) {
    PreferenceUtils.clear();
    AppRouter.login(context);
  } else if (status == 408) {
    AppUtils.toastMessage(message ?? '');
  }
}

dynamic apiHandle(int status, String message) {
  Failure sendData;
  switch (status) {
    // case 400:
    //   sendData = Left(BadRequestFailure("$message", status));
    case 401:
      sendData = UnauthorizedFailure("Unauthorised: $message", status);
    case 403:
      sendData = ForbiddenFailure("Forbidden: $message", status);
    case 408:
      sendData = RequestTimeoutFailure("Request Timeout: $message", status);
    case 500:
      sendData = InternalServerErrorFailure("Error : $message", status);
    case 502:
      sendData = BadGatewayErrorFailure("Bad Gateway : $message", status);
    default:
      sendData = InternalServerErrorFailure(
          "Error During Communication: $message", status);
  }
  return sendData;
}

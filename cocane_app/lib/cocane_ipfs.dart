import 'dart:convert';
import 'dart:io';

import 'package:cocane_app/classes/report.dart';
import 'package:path_provider/path_provider.dart';

// void tezt() async {
//   final directory = await getApplicationDocumentsDirectory();
//   print(directory.path);
//   final file = File('${directory.path}/text_file.txt');
//   await file.writeAsString('Hello');
//   print('Done');

//   final data = await file.readAsString();
//   print(data);

//   // IPFZ

//   IpfsClient ipfsClient = IpfsClient(url: "http://10.0.2.2:5001");
//   //var response = await ipfsClient.mkdir(dir: '/remake');
//   var response1 = await ipfsClient.write(
//       dir: '/testDir/text_file.txt',
//       filePath: '${directory.path}/text_file.txt',
//       fileName: "satext_file.txt");
//   //var response = await ipfsClient.mkdir(dir: 'myfolder');
//   //var response = await ipfsClient.ls(dir: 'testDir');
//   var response = await ipfsClient.read(dir: "/testDir/text_file.txt");
//   print(response);
// }

import 'package:dio/dio.dart';
import 'dart:math';

void makeReport(Report report) async {
  var l = Random().nextInt(999999 - 75);
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/' + l.toString() + '.txt');

  await file.writeAsString(report.toString());
  await writeReport(report, l.toString());
}

void makeDir(String dir) async {
  try {
    var dio = Dio();
    Response response =
        await dio.post('http://10.0.2.2:5001/api/v0/files/mkdir?',
            queryParameters: {
              'arg': dir,
              'parent': true,
            },
            options: Options(responseType: ResponseType.plain));
  } on DioError catch (e) {
    print(e);
  }
}

void readReports() async {
  var dio = Dio();
  var response = await dio.post('http://10.0.2.2:5001/api/v0/files/read?',
      queryParameters: {
        'arg': '/cocane/report.txt',
        'offset': 0,
        'count': 10000000,
      },
      options: Options(
        responseType: ResponseType.plain,
        headers: {
          "Authorization": "Basic ",
        },
      ));

  print(response);
}

void listFiles() async {
  var dio = Dio();
  var response = await dio.post('http://10.0.2.2:5001/api/v0/files/ls?',
      queryParameters: {
        'arg': '/testDir/',
        'long': true,
        'U': true,
      },
      options: Options(
        responseType: ResponseType.plain,
        headers: {
          "Authorization": "Basic ",
        },
      ));

  print(response);
}

Future<Response> writeReport(Report report, String filename) async {
  final directory = await getApplicationDocumentsDirectory();
  var dio = Dio();

  Response response = await dio.post('http://10.0.2.2:5001/api/v0/files/write?',
      queryParameters: {
        'arg': '/cocane/' + filename + '.txt',
        'create': true,
      },
      data: await _getFormData(
          '${directory.path}/' + filename, filename + '.txt', report),
      options: Options(
        responseType: ResponseType.plain,
        headers: {
          "Authorization": "Basic ",
        },
      ));
  return response;
}

Future<FormData> _getFormData(
    String filePath, String fileName, Report report) async {
  print('Setting up the connection...');
  return FormData.fromMap({
    'file': await MultipartFile.fromBytes(
      utf8.encode(
          Report(report.id, report.data, report.lat, report.longi).toString()),
      filename: fileName,
    ),
  });
}

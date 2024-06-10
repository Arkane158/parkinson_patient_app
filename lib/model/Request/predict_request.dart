// import 'dart:io';

// class PredictRequest {
//   final File file;

//   PredictRequest({
//     required this.file,
//   });

//   // This method constructs a multipart request body
//   // containing the file data.
//   FormData toFormData() {
//     return FormData.fromMap({
//       'file': await MultipartFile.fromFile(
//         file.path,
//         filename: 'file',
//       ),
//     });
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:net/provider/download_provider.dart';

// class Downloadexample extends StatefulWidget {
//   const Downloadexample({Key? key}) : super(key: key);

//   @override
//   State<Downloadexample> createState() => _DownloadexampleState();
// }

// class _DownloadexampleState extends State<Downloadexample> {
//   bool _isLoading = true;
//   String _errorMessage = '';

//   @override
//   void initState() {
//     super.initState();

//     // Trigger the data fetching process
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     try {
//       await Provider.of<DownloadProvider>(context, listen: false)
//           .getAllDownloads();
//       setState(() {
//         _isLoading = false;
//       });
//     } catch (error) {
//       setState(() {
//         _isLoading = false;
//         _errorMessage = 'Error fetching data: $error';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _errorMessage.isNotEmpty
//               ? Center(child: Text(_errorMessage))
//               : Consumer<DownloadProvider>(
//                   builder: (context, downloadProvider, child) {
//                     final imageList = downloadProvider.download;

//                     if (imageList.isEmpty) {
//                       return Center(child: Text('No images available.'));
//                     }

//                     return ListView.builder(
//                       itemCount: imageList.length,
//                       itemBuilder: (context, index) {
//                         final imageUrl = imageList[index].image;
//                         return Container(
//                           width: 200,
//                           height: 400,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                               image: NetworkImage(imageUrl),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//     );
//   }
// }

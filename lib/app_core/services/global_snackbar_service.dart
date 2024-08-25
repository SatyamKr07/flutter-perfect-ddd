// import 'package:flutter/material.dart';

// class GlobalSnackbarService {
//   static final GlobalSnackbarService _instance = GlobalSnackbarService._internal();
//   factory GlobalSnackbarService() => _instance;
//   GlobalSnackbarService._internal();

//   static OverlayState? _overlayState;
//   static OverlayEntry? _overlayEntry;

//   void init(BuildContext context) {
//     _overlayState = Overlay.of(context);
//   }

//   void showSnackbar(String message, {String? code}) {
//     if (_overlayState == null) return;

//     _overlayEntry?.remove();
//     _overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         bottom: 50,
//         left: 20,
//         right: 20,
//         child: Material(
//           elevation: 10,
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.red,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Error: $message', style: TextStyle(color: Colors.white)),
//                 if (code != null) Text('Code: $code', style: TextStyle(color: Colors.white)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

//     _overlayState!.insert(_overlayEntry!);

//     Future.delayed(Duration(seconds: 5), () {
//       _overlayEntry?.remove();
//       _overlayEntry = null;
//     });
//   }
// }
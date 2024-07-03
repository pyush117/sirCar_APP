import 'package:flutter/material.dart';


Widget BottomSheetButton(BuildContext context,
    {String? title, String? assetImagePath}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.black,
      minimumSize: const Size(500, 50),
    ),
    onPressed: () {
      showModalBottomSheet(
        barrierColor: Colors.grey,
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          );
        },
      );
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title ?? "",
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'bold',
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 8),
        if (assetImagePath != null && assetImagePath.isNotEmpty)
          Image.asset(
            assetImagePath,
            width: 50,
            height: 50,
          ),
      ],
    ),
  );
}

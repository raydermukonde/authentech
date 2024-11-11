import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HOME',
          style: TextStyle(
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Main container for all the options
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Individual option for "Check ID"
                      OptionTile(
                        iconPath: 'assets/images/check_id.png', // Your custom image path for "Check ID"
                        title: 'Check ID',
                        itemCount: '120 items',
                      ),
                      OptionTile(
                        iconPath: 'assets/images/check_document.png', // Your custom image path for "Check Document"
                        title: 'Check Document',
                        itemCount: '220 items',
                      ),
                      OptionTile(
                        iconPath: 'assets/images/scan_qr.png', // Your custom image path for "Scan QR code"
                        title: 'Scan QR code',
                        itemCount: '155 items',
                      ),
                      OptionTile(
                        iconPath: 'assets/images/check_signature.png', // Your custom image path for "Check signature"
                        title: 'Check signature',
                        itemCount: '25 items',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for each option tile
class OptionTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final String itemCount;

  OptionTile({
    required this.iconPath,
    required this.title,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Option icon
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(iconPath),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(width: 16),
            // Text information (title and item count)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  itemCount,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Spacer(),
            // Right arrow icon
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

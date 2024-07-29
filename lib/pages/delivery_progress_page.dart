import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryProgressPage extends StatelessWidget {
  final String location;
  final String estimatedTime;
  final String driverName;
  final String driverContact;
  final String paymentMethod;
  final String gcashNumber;
  final String actualTime;
  final int totalItems;
  final double totalPrice;

  const DeliveryProgressPage({
    super.key,
    required this.location,
    required this.estimatedTime,
    required this.driverName,
    required this.driverContact,
    required this.paymentMethod,
    this.gcashNumber = '',
    required this.actualTime,
    required this.totalItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Progress'),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Receipt Section
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Receipt',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                    ),
                    const SizedBox(height: 10),
                    _buildDetailRow('Location:', location),
                    _buildDetailRow('Estimated Delivery Time:', estimatedTime),
                    _buildDetailRow('Payment Method:', paymentMethod),
                    if (paymentMethod == 'gcash')
                      _buildDetailRow('GCash Number:', gcashNumber),
                    _buildDetailRow('Actual Time:', actualTime),
                    _buildDetailRow('Total Items:', '$totalItems'),
                    _buildDetailRow('Total Price:', 'Php ${totalPrice.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Driver Details Section
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Driver Details:',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                    ),
                    const SizedBox(height: 10),
                    _buildDetailRow('Name:', driverName),
                    _buildDetailRow('Contact:', driverContact),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Contact Driver Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _makePhoneCall('tel:$driverContact');
                  },
                  icon: const Icon(Icons.phone),
                  label: const Text('Call Driver'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    // Add message functionality here
                  },
                  icon: const Icon(Icons.message),
                  label: const Text('Message Driver'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blueAccent, side: const BorderSide(color: Colors.blueAccent),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            child: Text(
              content,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  void _makePhoneCall(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}

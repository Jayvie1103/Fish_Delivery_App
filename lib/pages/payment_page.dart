import 'package:fish_delivery_app/models/fishmarket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'delivery_progress_page.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override 
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod = 'cash';
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _gcashNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _selectPaymentMethod(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
  }

  void _confirmPayment() {
    if (_formKey.currentState?.validate() ?? false) {
      final paymentMethod = _selectedPaymentMethod;
      final location = _locationController.text;
      final gcashNumber = _gcashNumberController.text;
      final fishmarket = context.read<Fishmarket>(); // Access Fishmarket

      // Get cart details
      final cartItems = fishmarket.userCart;
      final totalItems = cartItems.length;
      final totalPrice = fishmarket.totalPrice;

      // Get the current time
      final now = DateTime.now();
      final actualTime = '${now.hour}:${now.minute}:${now.second}';

      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Payment'),
            content: Text(
              'Payment Method: $paymentMethod\n'
              'Location: $location\n'
              'GCash Number: $gcashNumber\n'
              'Actual Time: $actualTime\n'
              'Total Items: $totalItems\n'
              'Total Price: Php ${totalPrice.toStringAsFixed(2)}\n'
              'Do you want to proceed with the payment?',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeliveryProgressPage(
                        location: location,
                        estimatedTime: '30 minutes', // Example estimated time
                        driverName: 'Juan Dela Cruz', // Example driver name
                        driverContact: '09123456789', // Example driver contact
                        paymentMethod: paymentMethod,
                        gcashNumber: paymentMethod == 'gcash' ? gcashNumber : '',
                        actualTime: actualTime,
                        totalItems: totalItems,
                        totalPrice: totalPrice,
                      ),
                    ),
                  );
                },
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Payment Method',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Location Input Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Enter Delivery Location',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _locationController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Address',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // GCash Number Input
                    if (_selectedPaymentMethod == 'gcash')
                      TextFormField(
                        controller: _gcashNumberController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'GCash Number',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your GCash number';
                          }
                          return null;
                        },
                      ),
                  ],
                ),
              ),

              const Text(
                'Select Payment Method',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              
              // Cash on Delivery Option
              ListTile(
                leading: Icon(Icons.money_off_outlined, color: _selectedPaymentMethod == 'cash' ? Colors.green : Colors.grey),
                title: const Text('Cash on Delivery'),
                onTap: () => _selectPaymentMethod('cash'),
                tileColor: _selectedPaymentMethod == 'cash' ? Colors.green[100] : Colors.transparent,
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
              
              // GCash Option
              ListTile(
                leading: Image.asset('assets/images/gcash/gcash.png', height: 40, width: 40),
                title: const Text('GCash'),
                onTap: () => _selectPaymentMethod('gcash'),
                tileColor: _selectedPaymentMethod == 'gcash' ? Colors.green[100] : Colors.transparent,
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),

              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _confirmPayment,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Confirm Payment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

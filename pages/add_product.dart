import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddProductScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController fandomController = TextEditingController();
  final TextEditingController artistController = TextEditingController();
  final TextEditingController imagepathController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();

  Future<void> addProduct(BuildContext context) async {
    // Concatenate the base URL with the user input for the image path
    final String baseImageUrl =
        'https://github.com/Shannon2121441/assets/blob/main/';
    final String endImageUrl = '.png?raw=true';
    final String fullImagePath =
        baseImageUrl + imagepathController.text + endImageUrl;

    final response = await http.post(
      Uri.parse('http://s2121441.helioho.st/add_product.php'),
      body: {
        'name': nameController.text,
        'description': descriptionController.text,
        'price': priceController.text,
        'stock': stockController.text,
        'category': categoryController.text,
        'type': typeController.text,
        'fandom': fandomController.text,
        'artist': artistController.text,
        'imagepath': fullImagePath,
        'rating': ratingController.text,
      },
    );

    if (response.statusCode == 200) {
      try {
        final responseData = json.decode(response.body);
        final status = responseData['status'];
        final message = responseData['message'];

        if (status == 'success') {
          // Handle successful product addition
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
          // Redirect to product list or another appropriate screen
          Navigator.pop(context);
        } else {
          // Handle product addition error
          _showErrorDialog(context, message);
        }
      } catch (e) {
        print('Error parsing server response: $e');
        _showErrorDialog(context, 'Failed to parse server response.');
      }
    } else {
      _showErrorDialog(context, 'Server error: ${response.statusCode}');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                keyboardType: TextInputType.name,
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: stockController,
                decoration: InputDecoration(
                  labelText: 'Stock',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: categoryController,
                decoration: InputDecoration(
                  labelText: 'Category',
                ),
              ),
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  labelText: 'Type',
                ),
              ),
              TextField(
                controller: fandomController,
                decoration: InputDecoration(
                  labelText: 'Fandom',
                ),
              ),
              TextField(
                controller: artistController,
                decoration: InputDecoration(
                  labelText: 'Artist',
                ),
              ),
              TextField(
                controller: imagepathController,
                decoration: InputDecoration(
                  labelText: 'Image Path',
                ),
              ),
              TextField(
                controller: ratingController,
                decoration: InputDecoration(
                  labelText: 'Rating',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => addProduct(context),
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

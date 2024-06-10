import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/data/repositories/address/address_repository.dart';
import 'package:ziara/utils/const/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/features/shop/models/address_model.dart';
import 'package:ziara/data/repositories/address/address_repository.dart';

class AddAddressScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Address')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Enter a name' : null,
              ),
              TextFormField(
                controller: _streetController,
                decoration: InputDecoration(labelText: 'Street'),
                validator: (value) => value!.isEmpty ? 'Enter a street' : null,
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) => value!.isEmpty ? 'Enter a city' : null,
              ),
              TextFormField(
                controller: _stateController,
                decoration: InputDecoration(labelText: 'State'),
                validator: (value) => value!.isEmpty ? 'Enter a state' : null,
              ),
              TextFormField(
                controller: _postalCodeController,
                decoration: InputDecoration(labelText: 'Postal Code'),
                validator: (value) => value!.isEmpty ? 'Enter a postal code' : null,
              ),
              TextFormField(
                controller: _countryController,
                decoration: InputDecoration(labelText: 'Country'),
                validator: (value) => value!.isEmpty ? 'Enter a country' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final uid = FirebaseAuth.instance.currentUser!.uid;
                    final newAddress = AddressModel(
                      uid: uid,
                      name: _nameController.text,
                      street: _streetController.text,
                      city: _cityController.text,
                      state: _stateController.text,
                      postalCode: _postalCodeController.text,
                      country: _countryController.text,
                    );

                    try {
                      await AddressRepository().addAddress(newAddress);
                      Get.snackbar('Success', 'Address added successfully', snackPosition: SnackPosition.BOTTOM);
                      Navigator.pop(context);
                    } catch (e) {
                      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
                    }
                  }
                },
                child: Text('Add Address'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

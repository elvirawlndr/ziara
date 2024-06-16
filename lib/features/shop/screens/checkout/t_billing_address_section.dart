import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziara/features/shop/models/address_model.dart';
import 'package:ziara/features/shop/orders/order.dart';
import 'package:ziara/features/shop/screens/checkout/loading_page.dart';
import 'package:ziara/features/shop/screens/home/home.dart';
import 'package:ziara/utils/const/sizes.dart';
import 'package:ziara/utils/const/colors.dart';

class TBillingAddressSection extends StatefulWidget {
  const TBillingAddressSection({super.key});

  @override
  _TBillingAddressSectionState createState() => _TBillingAddressSectionState();
}

class _TBillingAddressSectionState extends State<TBillingAddressSection> {
  final User? user = FirebaseAuth.instance.currentUser;
  List<AddressModel> addresses = [];
  AddressModel? selectedAddress;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? userName;
  String? userPhoneNumber;

  @override
  void initState() {
    super.initState();
    _loadAddresses();
    _loadUserDetails();
  }

  Future<void> _loadAddresses() async {
    final QuerySnapshot snapshot = await firestore.collection('addresses').where('uid', isEqualTo: user?.uid).get();
    addresses = snapshot.docs.map((doc) => AddressModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    if (addresses.isNotEmpty) {
      selectedAddress = addresses[0];
    }
    setState(() {});
  }

  Future<void> _loadUserDetails() async {
    if (user != null) {
      final DocumentSnapshot userDoc = await firestore.collection('users').doc(user!.uid).get();
      if (userDoc.exists) {
        setState(() {
          userName = userDoc['name'];
          userPhoneNumber = userDoc['phoneNumber'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: '',
          onPressed: () {},
        ),
        if (user != null) ...[
          Row(
            children: [
              const Icon(Icons.person, color: TColors.grey, size: 16),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(userName ?? '', style: Theme.of(context).textTheme.bodyMedium),
          ]),
          const SizedBox(height: TSizes.spaceBtwItems),
          Row(
            children: [
              const Icon(Icons.phone, color: TColors.grey, size: 16),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(userPhoneNumber ?? '', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Row(
            children: [
              const Icon(Icons.location_on, color: TColors.grey, size: 16),
              const SizedBox(width: TSizes.spaceBtwItems),
              Flexible(
                child: DropdownButton<AddressModel>(
                  isExpanded: true,
                  value: selectedAddress,
                  items: addresses.map((address) {
                    return DropdownMenuItem<AddressModel>(
                      value: address,
                      child: Text(
                        '${address.street}, ${address.city}, ${address.state}, ${address.country}',
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedAddress = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ] else ...[
          Text('No user logged in', style: Theme.of(context).textTheme.bodyLarge),
        ],
      ],
    );
  }

  void _performCheckout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => LoadingPage(),
      barrierDismissible: false,
    );

    try {
      await _processCheckout();
      Navigator.of(context).pop();

      Get.offAll(() => OrderScreen()); 
    } catch (e) {
      print('Checkout failed: $e');
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to process checkout. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _processCheckout() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}

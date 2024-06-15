import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ziara/features/shop/screens/home/home.dart';
import 'package:ziara/utils/const/sizes.dart';
import 'package:ziara/utils/const/colors.dart';

class TBillingAddressSection extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  TBillingAddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        if (user != null) ...[
          Text(user!.displayName ?? '', style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(width: TSizes.spaceBtwItems),
          Row(
            children: [
              const Icon(Icons.phone, color: TColors.grey, size: 16),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(user!.phoneNumber ?? '', style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Row(
            children: [
              const Icon(Icons.location_on, color: TColors.grey, size: 16),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: Text(
                   '',
                  style: Theme.of(context).textTheme.bodyText2,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ] else ...[
          Text('No user logged in'),
        ],
      ],
    );
  }
}

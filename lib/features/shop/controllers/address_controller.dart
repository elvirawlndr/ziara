import 'package:get/get.dart';
import 'package:ziara/data/repositories/address/address_repository.dart';
import 'package:ziara/features/shop/models/address_model.dart';
import 'package:ziara/utils/const/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  Future<List<AddressModel>> allUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
        (element) => element.selectedAddress,
        orElse: () => AddressModel.empty()
      );
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future<void> addNewAddress(AddressModel newAddress) async {
    try {
      await addressRepository.addAddress(newAddress);
      TLoaders.successSnackBar(title: 'Success', message: 'Address added successfully');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}

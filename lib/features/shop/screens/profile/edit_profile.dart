import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ziara/common/widgets/appbar.dart';
import 'package:ziara/data/repositories/authentication/authentication_repository.dart';
import 'package:ziara/data/repositories/user/user_repository.dart';
import 'package:ziara/features/personalization/models/usermodel.dart';
import 'package:ziara/utils/const/colors.dart';
import 'package:ziara/utils/const/image_strings.dart';
import 'package:ziara/utils/const/sizes.dart';
import 'package:ziara/utils/const/text_strings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final UserRepository _userRepository = UserRepository.instance;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  XFile? _profileImage;
  final ImagePicker _picker = ImagePicker();

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    if (user != null) {
      final userData = await AuthenticationRepository.instance.getUserData(user!.uid);
      setState(() {
        _nameController.text = userData.name;
        _emailController.text = userData.email;
        _phoneController.text = userData.phoneNumber;
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _profileImage = image;
      });
  }

  void _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        final user = FirebaseAuth.instance.currentUser;
        // Update email and password in Firebase Auth
        if (_emailController.text.isNotEmpty && _emailController.text != user!.email) {
          await user.updateEmail(_emailController.text);
        }
        if (_passwordController.text.isNotEmpty) {
          await user!.updatePassword(_passwordController.text);
        }

        // Update user data in Firestore
        UserModel updatedUser = UserModel(
          uid: user!.uid,
          name: _nameController.text,
          email: _emailController.text,
          phoneNumber: _phoneController.text,
          profilePicture: user.photoURL ?? '',
          address: '', 
        );

        await AuthenticationRepository.instance.updateUserData(updatedUser);
        
      } catch (e) {
        
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Edit Profile', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage(TImages.profile)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: TTexts.name,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: TTexts.email,
                        prefixIcon: Icon(Iconsax.message),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: TTexts.phoneNumber,
                        prefixIcon: Icon(Iconsax.call),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: Icon(Iconsax.key),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                      width: 500,
                      child: ElevatedButton(
                        onPressed: _updateProfile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.darkBase,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Save Changes',
                          style: TextStyle(color: TColors.white, fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

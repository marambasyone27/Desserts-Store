import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maramstore/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _image;
  String? name;
  String? email;
  String? phone;
  String? imagePath;
  String? selectedGender = "Male";
  DateTime? selectedDate = DateTime.now();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      email = prefs.getString('email');
      phone = prefs.getString('phone');
      imagePath = prefs.getString('imagePath'); // Load the image path
      selectedGender = prefs.getString('gender');
      String? dateString = prefs.getString('birthdate');
      if (dateString != null) {
        selectedDate = DateTime.parse(dateString);
      }
      _image = imagePath != null && imagePath!.isNotEmpty
          ? imagePath
          : null;
    });
  }


  Future<void> saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name ?? '');
    prefs.setString('email', email ?? '');
    prefs.setString('phone', phone ?? '');
    prefs.setString('imagePath', imagePath ?? '');
    prefs.setString('gender', selectedGender ?? '');
    prefs.setString('birthdate', selectedDate != null ? selectedDate!.toIso8601String() : '');
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        saveUserData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          // light and dark mode button
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode
                  ? Icons.dark_mode
                  :Icons.light_mode,
              color: Colors.white,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
        shadowColor: const Color.fromARGB(255, 96, 5, 35),
        elevation: 2.0,
        backgroundColor: Colors.pink,
        title: const Text(
          "Personal Information",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.pinkAccent,
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //const SizedBox(height: 2),
                  Center(
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/images/cat8.jpg", // الصورة الافتراضية
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                          ),
                        ),
                        Positioned(
                          bottom: 0, 
                          right: 0,  
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt, color: Color.fromARGB(255, 241, 204, 204) ),
                            onPressed:(){},
                            tooltip: "Edit Profile Image",
                            color: Colors.pinkAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 162, 189),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        _buildInfoCard(
                          icon: Icons.person,
                          label: "Name",
                          value: name ?? '',
                        ),
                        _buildInfoCard(
                          icon: Icons.email,
                          label: "Email",
                          value: email ?? '',
                        ),
                        _buildInfoCard(
                          icon: Icons.phone,
                          label: "Phone",
                          value: phone ?? '',
                        ),
                        const SizedBox(height: 20),
                        _buildDropdown(
                          label: "Gender",
                          value: selectedGender,
                          items: ['Male', 'Female'],
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGender = newValue;
                              saveUserData();
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        _buildDateField(
                          label: "BirthDate",
                          value: selectedDate != null
                              ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                              : 'Select your Birthdate',
                          onTap: () => _selectDate(context),
                        ),
                        const SizedBox(height: 20),
                        _buildSignOutButton(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() => _isLoading = true);
                      await saveUserData();
                      setState(() => _isLoading = false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Changes saved successfully')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.pink,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: const Text("Save Changes"),
                  ),
                  if (_isLoading)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.pinkAccent),
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink),
        ),
        subtitle: Text(value, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.pink),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: value,
          hint: Text("Select your $label" , style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 17,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),),
          dropdownColor: const Color.fromARGB(255, 243, 162, 189),
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 17,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildDateField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.pink),
        ),
        const SizedBox(height: 5),
        TextFormField(
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 17,
            fontFamily: 'RobotoMono',
            color: Color.fromARGB(255, 225, 5, 78),
            fontWeight: FontWeight.bold,
          ),
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.white,
            hintText: value,
            hintStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 17,
              fontFamily: 'RobotoMono',
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold,
            ),
            suffixIcon: Icon(Icons.calendar_today, color: Colors.pink),
          ),
        ),
      ],
    );
  }

  Widget _buildSignOutButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Sign Out",
                style: TextStyle(color: Colors.white, fontSize: 19)),
          ),
        ],
      ),
    );
  }
}

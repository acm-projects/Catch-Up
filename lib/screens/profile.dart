import "package:flutter/material.dart";

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(130, 185, 119, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(130, 185, 119, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 15, right: 16),
        child: GestureDetector(
          // allows user to unselect text field
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Center(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15, // creates space between text and profile image
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          // border color and width around the profile image
                          width: 4,
                          color: const Color.fromRGBO(130, 185, 119, 1),
                        ),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: const Color.fromRGBO(130, 185, 119, 1),
                          ),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.edit, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35, // space between profile pic and first text field
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildUserInfoField("First Name", "Ridwan Amin", false),
                  buildUserInfoField("Last Name", "Amin", false),
                  buildUserInfoField(
                      "Edit Email", "someEmail@gmail.com", false),
                  buildUserInfoField("Edit Password", "**********", true),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(215, 151, 132, 1),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUserInfoField(
      String bottomText, String placeHolder, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 25,
            offset: Offset(0, 0),
          )
        ]),
        child: TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Colors.white),
            ),
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            fillColor: const Color.fromRGBO(215, 151, 132, 1),
            filled: true,
            helperText: bottomText,
            helperStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeHolder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedTab = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),

              CircleAvatar(
                
                radius: 40,
                backgroundImage: AssetImage('assets/images/profile.png'),
                backgroundColor: Colors.grey.shade300,
              ),

              const SizedBox(height: 15),

              const Text(
                "Christina Angela",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "@angela.christina123",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 25),

              Row(
                children: [
                  Expanded(child: _buildTabButton("General", 0)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildTabButton("Badges", 1)),
                ],
              ),

              const SizedBox(height: 20),

              _buildInfoItem(
                icon: Icons.person,
                title: "Name",
                
                subtitle: "Christina Angela",
              ),
              _buildInfoItem(
                icon: Icons.email_outlined,
                title: "Email",
                subtitle: "christina.angela123@gmail.com",
              ),
              _buildInfoItem(
                icon: Icons.lock_outline,
                title: "Password",
                subtitle: "Tap to Change Password",
              ),
              _buildInfoItem(
                icon: Icons.phone,
                title: "Phone Number",
                subtitle: "(684) 555-0102",
              ),
              _buildInfoItem(
                icon: Icons.credit_card_outlined,
                title: "Payment",
                subtitle: "Tap to Change Payment",
              ),
              _buildInfoItem(
                icon: Icons.privacy_tip_outlined,
                title: "Privacy Policy",
                subtitle: "Tap to See Privacy Policy",
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue, width: 1.5),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, 
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Become Premium",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {},
                child: const Text(
                  "LOG OUT",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Account",
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    final bool isSelected = selectedTab == index;

    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ?  Colors.blueAccent : Colors.grey.shade200,
          borderRadius: BorderRadius.zero, 
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: isSelected ? 17 : 15,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blueAccent),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          trailing ?? const Text("Edit", style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}

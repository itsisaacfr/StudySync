import 'package:flutter/material.dart';

class ClassSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 2),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "Class Schedule",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                "Fighting!",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),

              // Course Info
              Center(
                child: Column(
                  children: [
                    Text(
                      "BCS24",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Computer Science",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    Text(
                      "Second Semester",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Class Schedule Grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  children: [
                    scheduleCard("Mon", "Ethics", "8:30 - 10:30"),
                    scheduleCard("", "STS", "11:30 - 1:00"),
                    scheduleCard("", "DS2", "2:00 - 5:00"),
                    scheduleCard("Tue", "App Dev Lab", "10:00 - 12:00"),
                    scheduleCard("", "Prog Lang Lec", "1:00 - 2:00"),
                    scheduleCard("Wed", "No Classes", ""),
                    scheduleCard("Thu", "Async Day", "8:30 - 10:00 Ethics"),
                    scheduleCard("", "", "11:30 - 1:00 STS"),
                    scheduleCard("Fri", "App Dev Lab", "10:00 - 1:00"),
                    scheduleCard("", "Forensics", "1:00 - 3:00"),
                    scheduleCard("", "Prog Lang Lab", "4:00 - 7:00"),
                    scheduleCard("Sat", "Rizal", "10:00 - 11:30"),
                    scheduleCard("", "Info Man Lec", "1:00 - 3:00"),
                    scheduleCard("", "Info Man Lab", "4:00 - 6:00"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Schedule Card Widget
  Widget scheduleCard(String day, String subject, String time) {
    return Container(
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.lightGreen[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(subject, style: TextStyle(fontSize: 16)),
          Text(time, style: TextStyle(fontSize: 14, color: Colors.black54)),
        ],
      ),
    );
  }
}

// Bottom Navigation Bar (Reused)
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  CustomBottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.teal,
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: currentIndex == 0 ? Colors.white : Colors.black54),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black54),
            onPressed: () {},
          ),
          SizedBox(width: 40), // Space for floating action button
          IconButton(
            icon: Icon(Icons.calendar_today, color: currentIndex == 1 ? Colors.white : Colors.black54),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

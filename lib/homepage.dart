import 'package:flutter/material.dart';

import 'util/job_card.dart';
import 'util/recent_job_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List jobsForYou = [
    ['Facebook', 'Java Developer', 'lib/icons/facebook.png', 65],
    ['Apple', 'Flutter Developer', 'lib/icons/apple.png', 75],
    ['Oracle', 'Data Engineer', 'lib/icons/oracle.png', 85],
    ['Microsoft', 'Data Scientist', 'lib/icons/microsoft.png', 95],
  ];

  final List recentJobs = [
    ['Vkontakte', 'Data Analyst', 'lib/icons/vk.png', 55],
    ['Apple', 'DevOps', 'lib/icons/apple.png', 55],
    ['Oracle', 'Database Administrator', 'lib/icons/oracle.png', 55],
    ['Microsoft', 'Project Manager', 'lib/icons/microsoft.png', 55],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 75,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200]),
              child: Image.asset(
                'lib/icons/icons8-menu-64.png',
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Discover a new path',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
                            height: 30,
                            child: Image.asset('lib/icons/icons8-search-30.png',
                                color: Colors.grey[600]),
                          ),
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search for a job..'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset('lib/icons/icons8-preferences-66.png',
                      color: Colors.white),
                )
              ],
            ),
          ),

          const SizedBox(height: 50),
          // for you - job card
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'For You',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),

          const SizedBox(height: 25),

          Container(
            height: 150,
            child: ListView.builder(
                itemCount: jobsForYou.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return JobCard(
                    companyName: jobsForYou[index][0],
                    jobTitle: jobsForYou[index][1],
                    logoImagePath: jobsForYou[index][2],
                    hourlyRate: jobsForYou[index][3],
                  );
                }),
          ),
          const SizedBox(height: 40),
          // recently added

          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Recently added',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),

          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView.builder(
                itemCount: recentJobs.length,
                itemBuilder: ((context, index) {
                  return RecentJobCard(
                    companyName: recentJobs[index][0],
                    jobTitle: recentJobs[index][1],
                    logoImagePath: recentJobs[index][2],
                    hourlyRate: recentJobs[index][3],
                  );
                })),
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_anne/MoodTrack/sumpage.dart';

class Addmood extends StatefulWidget {
  const Addmood({super.key});

  @override
  State<Addmood> createState() => _AddmoodState();
}

class _AddmoodState extends State<Addmood> {
  List<int?> selectedMoods = [null, null, null];

  final Map<int, List<int>> moodValues = {
    0: [1, 1, 1, 0, 0],
    1: [0, 1, 1, 1, 0],
    2: [1, 1, 1, 0, 0],
  };

  final List<String> moodImages = [
    "assets/images/mood/excited.png",
    "assets/images/mood/happy.png",
    "assets/images/mood/neutral.png",
    "assets/images/mood/sad.png",
    "assets/images/mood/anrgy.png",
  ];
  final List<String> weatherImages = [
    "assets/images/weather/hot.png",
    "assets/images/weather/sunny.png",
    "assets/images/weather/windy.png",
    "assets/images/weather/rainy.png",
    "assets/images/weather/strom.png"
  ];
  final List<String> nightImages = [
    "assets/images/night/sleepy.png",
    "assets/images/night/loveyourself.png",
    "assets/images/night/inspired.png",
    "assets/images/night/worry.png",
    "assets/images/night/lowenergy.png",
  ];
  final List<String> namebox = [
    "Mood About Day?",
    "Mood About Weather",
    "Mood About Night?",
  ];

  bool isAllSelected() {
    return selectedMoods.every((element) => element != null);
  }

  double get completionPercentage {
    int completed = selectedMoods.where((e) => e != null).length;
    return completed / selectedMoods.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 255, 245),
      appBar: AppBar(
        title: const Text(
          "How Today?",
          style:
              TextStyle(color: Color(0xFF534684), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined,
              size: 25, color: Color(0xFF534684)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Progress Circle
            Transform.translate(
              offset: const Offset(0, -40),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 250.0,
                    height: 250.0,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 243, 178),
                      shape: BoxShape.circle,
                    ),
                  ),
                  //กำหนดตำแหน่ง
                  Positioned(
                    bottom: 0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 250,
                      height: 250 * completionPercentage,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 231, 130, 169)
                            .withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // ตัวเลขตรงกลาง/ขยายให้เต็มขนาด
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        "${(completionPercentage * 100).toInt()}%",
                        style: const TextStyle(
                          fontSize: 32, // ปรับขนาดตัวอักษร
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 109, 109, 109),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Mood Selection BoxesF สร้างและแทรกลิสต์ตามจำนวนที่กำหนด
            ...List.generate(3, (boxIndex) {
              return Column(
                children: [
                  Container(
                    width: 370.0,
                    height: 135.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 167, 167, 167),
                          blurRadius: 5,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 13,
                          left: 20,
                          child: Text(
                            namebox[boxIndex],
                            style: const TextStyle(
                                color: Color(0xFF534684), fontSize: 18),
                          ),
                        ),
                        Positioned(
                          bottom: 6,
                          left: (370.0 - 365) / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedMoods[boxIndex] = index;
                                  });
                                },
                                child: Container(
                                  width: 63.0,
                                  height: 63.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: selectedMoods[boxIndex] == index
                                        ? const Color.fromARGB(
                                            255, 241, 255, 204)
                                        : const Color.fromARGB(
                                            255, 255, 255, 255),
                                    shape: BoxShape.circle,
                                    boxShadow: selectedMoods[boxIndex] == index
                                        ? [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              blurRadius: 10,
                                              offset: const Offset(0, 4),
                                            ),
                                          ]
                                        : [],
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      boxIndex == 0
                                          ? moodImages[index]
                                          : boxIndex == 1
                                              ? weatherImages[index]
                                              : nightImages[index],
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(Icons.error,
                                            color: Colors.red, size: 40);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }),

            const SizedBox(height: 20),

            // Submit Button
            if (isAllSelected())
              ElevatedButton(
                onPressed: () {
                  int totalMood =
                      selectedMoods.asMap().entries.fold(0, (sum, entry) {
                    int boxIndex = entry.key;
                    int selectedIndex = entry.value!;
                    return sum + moodValues[boxIndex]![selectedIndex];
                  });

                  String result = totalMood == 3
                      ? "You're feeling great! Keep shining!"
                      : "Not your best day? Tomorrow is a new start!";

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Are You Today"),
                        content: Text("$result"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,MaterialPageRoute(builder: (context) => SummarizePage()),
                              );
                            },
                            child: const Text("Next"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Submit"),
              ),
          ],
        ),
      ),
    );
  }
}

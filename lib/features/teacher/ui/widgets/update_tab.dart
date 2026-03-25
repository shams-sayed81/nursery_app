import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../parent/data/models/child_model.dart';
import '../../manager/teacher_cubit.dart';

class UpdateActivityTab extends StatefulWidget {
  const UpdateActivityTab({super.key});

  @override
  State<UpdateActivityTab> createState() => _UpdateActivityTabState();
}

class _UpdateActivityTabState extends State<UpdateActivityTab>
    with SingleTickerProviderStateMixin {

  late TabController tabController;

  String? selectedStudent;

  int breakfast = -1;
  int lunch = -1;
  int snack = -1;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);

    context.read<TeacherStudentsCubit>().loadStudents();

    tabController.addListener(() {

      final cubit = context.read<TeacherStudentsCubit>();

      if (tabController.index == 0) {
        cubit.clearFilter();
      }

      if (tabController.index == 1) {
        cubit.filterByReligion("Christian");
      }

      if (tabController.index == 2) {
        cubit.filterByClass("Sunflowers");
      }

      if (tabController.index == 3) {
        cubit.filterByYear("2025");
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("Update Activity"),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: "All"),
            Tab(text: "Religion"),
            Tab(text: "Class"),
            Tab(text: "Year"),
          ],
        ),
      ),

      body: BlocBuilder<TeacherStudentsCubit, TeacherStudentsState>(
        builder: (context, state) {

          if (state is TeacherStudentsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          List<ChildModel> students = [];

          if (state is TeacherStudentsLoaded) {
            students = state.students;
          }

          if (state is TeacherClassesLoaded) {
            students = state.classes.expand((c) => c.students).toList();
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [

              _studentsSelector(students),

              const SizedBox(height: 20),

              _activityIcons(),

              const SizedBox(height: 20),

              _mealCard(
                "Breakfast",
                breakfast,
                    (v) {
                  setState(() {
                    breakfast = v;
                  });
                },
                Colors.orange,
              ),

              _mealCard(
                "Lunch",
                lunch,
                    (v) {
                  setState(() {
                    lunch = v;
                  });
                },
                Colors.green,
              ),

              _mealCard(
                "Snack",
                snack,
                    (v) {
                  setState(() {
                    snack = v;
                  });
                },
                Colors.blue,
              ),

              const SizedBox(height: 10),

              _saveButton(),

              const SizedBox(height: 20),

              _quickAccess(students)

            ],
          );
        },
      ),
    );
  }

  /// students scroll
  Widget _studentsSelector(List<ChildModel> students) {

    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: students.length,
        itemBuilder: (context, index) {

          final student = students[index];

          bool selected = selectedStudent == student.id;

          String initials = student.name
              .split(" ")
              .map((e) => e[0])
              .take(2)
              .join();

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedStudent = student.id;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 70,
              child: Column(
                children: [

                  CircleAvatar(
                    radius: 22,
                    backgroundColor: selected
                        ? const Color(0xff17B890)
                        : Colors.grey.shade200,
                    child: Text(
                      initials,
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    student.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// activity icons
  Widget _activityIcons() {

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [

          Icon(Icons.water_drop_outlined),
          Icon(Icons.nightlight_round),
          Icon(Icons.mood),
          Icon(Icons.music_note),
          Icon(Icons.camera_alt_outlined),

        ],
      ),
    );
  }

  /// meal card
  Widget _mealCard(
      String title,
      int value,
      Function(int) onTap,
      Color color,
      ) {

    List meals = [0, 50, 100];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Row(
            children: meals.map((m) {

              bool selected = value == m;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    onTap(m);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: selected ? color.withOpacity(.15) : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: selected ? color : Colors.grey.shade300,
                      ),
                    ),

                    child: Column(
                      children: [

                        Text(
                          "$m%",
                          style: TextStyle(
                            color: selected ? color : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          m == 0
                              ? "None"
                              : m == 50
                              ? "Half"
                              : "All",
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _saveButton() {

    return SizedBox(
      height: 50,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff17B890),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),

        onPressed: () {},

        child: const Text("Save Update"),
      ),
    );
  }

  Widget _quickAccess(List<ChildModel> students) {

    if (students.isEmpty) return const SizedBox();

    final student = students.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Quick Student Access",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),

          child: Row(
            children: [

              CircleAvatar(
                child: Text(student.name[0]),
              ),

              const SizedBox(width: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    student.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "Age ${student.age}",
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),

              const Spacer(),

              const Icon(Icons.arrow_forward_ios, size: 16)
            ],
          ),
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/features/teacher/manager/teacher_cubit.dart';

enum FilterType { religion, year, all }

class StudentsFilterScreen extends StatefulWidget {
  final FilterType filterType;

  const StudentsFilterScreen({
    super.key,
    required this.filterType,
  });

  static const String routeName = '/students-filter';

  @override
  State<StudentsFilterScreen> createState() =>
      _StudentsFilterScreenState();
}

class _StudentsFilterScreenState
    extends State<StudentsFilterScreen> {

  @override
  void initState() {
    super.initState();

    if (widget.filterType == FilterType.all) {
      context.read<TeacherStudentsCubit>().resetAllFilters();
    } else {
      context.read<TeacherStudentsCubit>().resetAllFilters();
    }
  }

  List<String> getOptions() {
    switch (widget.filterType) {
      case FilterType.religion:
        return ["Christian", "Muslim", "Other"];
      case FilterType.year:
        return ["Year 1", "Year 2", "Year 3"];
      case FilterType.all:
        return [];
    }
  }

  String getTitle() {
    switch (widget.filterType) {
      case FilterType.religion:
        return "Select Religion";
      case FilterType.year:
        return "Select Year";
      case FilterType.all:
        return "All Students";
    }
  }

  void handleFilter(String value) {
    final cubit = context.read<TeacherStudentsCubit>();

    if (widget.filterType == FilterType.religion) {
      cubit.filterByReligion(value);
    } else if (widget.filterType == FilterType.year) {
      cubit.filterByYear(value);
    }
  }

  String? getSelectedValue(TeacherStudentsCubit cubit) {
    if (widget.filterType == FilterType.religion) {
      return cubit.selectedReligion;
    } else if (widget.filterType == FilterType.year) {
      return cubit.selectedYear;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.filterType == FilterType.all
              ? "All Students"
              : "Back to Dashboard",
          style: const TextStyle(
              color: Colors.black, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<TeacherStudentsCubit,
            TeacherStudentsState>(
          builder: (context, state) {
            final cubit =
            context.read<TeacherStudentsCubit>();
            final selectedValue =
            getSelectedValue(cubit);

            return Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                /// 🔹 العنوان يظهر فقط لو مش all
                if (widget.filterType !=
                    FilterType.all) ...[
                  Text(
                    getTitle(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],

                /// 🔘 الأزرار تظهر فقط لو مش all
                if (widget.filterType !=
                    FilterType.all)
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children:
                    getOptions().map((option) {
                      final isSelected =
                          selectedValue == option;

                      return GestureDetector(
                        onTap: () =>
                            handleFilter(option),
                        child: AnimatedContainer(
                          duration:
                          const Duration(
                              milliseconds: 250),
                          width: MediaQuery.of(
                              context)
                              .size
                              .width *
                              0.4,
                          padding:
                          const EdgeInsets
                              .symmetric(
                              vertical: 18),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(
                                0xffEC2E8B)
                                : Colors.white,
                            borderRadius:
                            BorderRadius
                                .circular(40),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(
                                  0xffEC2E8B)
                                  : Colors.grey
                                  .shade300,
                            ),
                          ),
                          alignment:
                          Alignment.center,
                          child: Text(
                            option,
                            style: TextStyle(
                              fontWeight:
                              FontWeight.w600,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                if (widget.filterType !=
                    FilterType.all)
                  const SizedBox(height: 30),

                /// 📋 Students List
                Expanded(
                  child: Builder(
                    builder: (_) {
                      if (state
                      is TeacherStudentsLoading) {
                        return const Center(
                            child:
                            CircularProgressIndicator());
                      }

                      if (state
                      is TeacherStudentsLoaded) {
                        if (state
                            .students.isEmpty) {
                          return const Center(
                              child: Text(
                                  "No students found"));
                        }

                        return ListView.builder(
                          itemCount:
                          state.students.length,
                          itemBuilder:
                              (context, index) {
                            final s =
                            state.students[
                            index];

                            return Container(
                              margin:
                              const EdgeInsets
                                  .symmetric(
                                  vertical:
                                  8),
                              padding:
                              const EdgeInsets
                                  .all(16),
                              decoration:
                              BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors
                                        .black
                                        .withValues(
                                        alpha:
                                        0.05),
                                    blurRadius:
                                    10,
                                    offset:
                                    const Offset(
                                        0, 4),
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundColor:
                                    const Color(
                                        0xffFDE8F3),
                                    child: Text(
                                      s.name[0]
                                          .toUpperCase(),
                                      style:
                                      const TextStyle(
                                        color: Color(
                                            0xffEC2E8B),
                                        fontWeight:
                                        FontWeight
                                            .bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          s.name,
                                          style:
                                          const TextStyle(
                                            fontWeight:
                                            FontWeight
                                                .w600,
                                            fontSize:
                                            16,
                                          ),
                                        ),
                                        const SizedBox(
                                            height:
                                            4),
                                        Text(
                                          'Age ${s.age} • Year ${s.year}',
                                          style:
                                          TextStyle(
                                            fontSize:
                                            13,
                                            color: Colors
                                                .grey
                                                .shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
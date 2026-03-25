import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_text_feild.dart';
import '../data/models/admin_class_model.dart';
import '../manager/admin_cubit.dart';

class CreateEditClassDialog extends StatefulWidget {
  final AdminClassModel? classModel;

  const CreateEditClassDialog({super.key, this.classModel});

  @override
  State<CreateEditClassDialog> createState() => _CreateEditClassDialogState();
}

class _CreateEditClassDialogState extends State<CreateEditClassDialog> {

  final nameController = TextEditingController();
  final teacherController = TextEditingController();

  String? selectedAgeGroup;

  final List<String> ageGroups = [
    "3 - 4",
    "4 - 5",
    "5 - 6",
  ];

  bool get isEdit => widget.classModel != null;

  @override
  void initState() {
    super.initState();

    if (isEdit) {
      nameController.text = widget.classModel!.name;
      teacherController.text = widget.classModel!.id;
      selectedAgeGroup = widget.classModel!.year;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  isEdit ? "Edit Class" : "Create New Class",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),

            const SizedBox(height: 20),

            /// Class Name
            CustomTextFormField(
              controller: nameController,
              labelText: "Class Name",
              hintText: "e.g., Toddlers Group A",
              textInputType: TextInputType.text,
            ),

            const SizedBox(height: 14),

            /// Age Dropdown
            DropdownButtonFormField<String>(
              initialValue: selectedAgeGroup,
              decoration: const InputDecoration(
                labelText: "Age Group",
              ),
              items: ageGroups.map((age) {
                return DropdownMenuItem(
                  value: age,
                  child: Text(age),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedAgeGroup = value;
                });
              },
            ),

            const SizedBox(height: 14),

            /// Teacher ID
            CustomTextFormField(
              controller: teacherController,
              labelText: "Lead Teacher ID",
              hintText: "Teacher ID or email",
              textInputType: TextInputType.text,
            ),

            const SizedBox(height: 20),

            /// Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  final cubit = context.read<AdminCubit>();

                  if (isEdit) {

                    cubit.updateClass(
                      widget.classModel!.copyWith(
                        name: nameController.text,
                        year: selectedAgeGroup!,
                      ),
                    );

                  } else {

                    final newClass = AdminClassModel(
                      id: DateTime.now().toString(),
                      name: nameController.text,
                      year: selectedAgeGroup!,
                      studentsCount: 0,
                      isActive: true,
                    );

                    cubit.addClass(newClass);
                  }

                  Navigator.pop(context);
                },
                child: Text(isEdit ? "Save Changes" : "Create Class"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
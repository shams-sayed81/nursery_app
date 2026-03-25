import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/custom_text_feild.dart';
import '../../parent/data/models/child_model.dart';
import '../../parent/data/models/parent_model.dart';
import '../manager/admin_cubit.dart';

class CreateParentAccountView extends StatefulWidget {
  const CreateParentAccountView({super.key});
  static const String routeName='/create-parent';

  @override
  State<CreateParentAccountView> createState() =>
      _CreateParentAccountViewState();
}

class _CreateParentAccountViewState extends State<CreateParentAccountView> {

  final _formKey = GlobalKey<FormState>();

  final parentNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final childNameController = TextEditingController();
  final ageController = TextEditingController();

  String selectedReligion = "Muslim";
  String selectedYear = "Year 1";
  String selectedClass = "Sunflowers";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Parent Account"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              /// Parent Information
              _sectionContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Parent Information",
                        style: AppTextStyles.font16BlackBold),

                    const SizedBox(height: 16),

                    CustomTextFormField(
                      controller: parentNameController,
                      labelText: "Parent Name",
                      hintText: "e.g., Sarah Johnson",
                      textInputType: TextInputType.name,
                    ),

                    const SizedBox(height: 12),

                    CustomTextFormField(
                      controller: emailController,
                      labelText: "Email (Login Username)",
                      hintText: "e.g., sarah@example.com",
                      textInputType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 12),

                    CustomTextFormField(
                      controller: passwordController,
                      labelText: "Password",
                      hintText: "e.g., password123",
                      textInputType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// Child Information
              _sectionContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Child Information",
                        style: AppTextStyles.font16BlackBold),

                    const SizedBox(height: 16),

                    CustomTextFormField(
                      controller: childNameController,
                      labelText: "Child Name",
                      hintText: "e.g., Emma Johnson",
                      textInputType: TextInputType.name,
                    ),

                    const SizedBox(height: 12),

                    CustomTextFormField(
                      controller: ageController,
                      labelText: "Age",
                      hintText: "e.g., 3",
                      textInputType: TextInputType.number,
                    ),

                    const SizedBox(height: 20),

                    /// Religion
                    Text("Religion", style: AppTextStyles.font16BlackBold),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        _selectButton("Muslim", selectedReligion, (value) {
                          setState(() => selectedReligion = value);
                        }),
                        _selectButton("Christian", selectedReligion, (value) {
                          setState(() => selectedReligion = value);
                        }),
                        _selectButton("Other", selectedReligion, (value) {
                          setState(() => selectedReligion = value);
                        }),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// Year Group
                    Text("Year Group", style: AppTextStyles.font16BlackBold),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        _selectButton("Year 1", selectedYear, (value) {
                          setState(() => selectedYear = value);
                        }),
                        _selectButton("Year 2", selectedYear, (value) {
                          setState(() => selectedYear = value);
                        }),
                        _selectButton("Year 3", selectedYear, (value) {
                          setState(() => selectedYear = value);
                        }),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// Class
                    Text("Class", style: AppTextStyles.font16BlackBold),

                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _selectButton("Sunflowers", selectedClass, (value) {
                          setState(() => selectedClass = value);
                        }),
                        _selectButton("Butterflies", selectedClass, (value) {
                          setState(() => selectedClass = value);
                        }),
                        _selectButton("Rainbows", selectedClass, (value) {
                          setState(() => selectedClass = value);
                        }),
                        _selectButton("Stars", selectedClass, (value) {
                          setState(() => selectedClass = value);
                        }),
                        _selectButton("Dolphins", selectedClass, (value) {
                          setState(() => selectedClass = value);
                        }),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// Create Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {

                    if (_formKey.currentState!.validate()) {

                      final parentId =
                      DateTime.now().millisecondsSinceEpoch.toString();
                      final childId =
                      DateTime.now().millisecondsSinceEpoch.toString();

                      final child = ChildModel(
                        id: childId,
                        name: childNameController.text,
                        age: int.parse(ageController.text),
                        classId: selectedClass,
                        parentId: parentId,
                        religion: selectedReligion,
                        className: selectedClass,
                        year: selectedYear,
                      );

                      final parent = ParentModel(
                        id: parentId,
                        name: parentNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        children: [child],
                      );

                      context.read<AdminCubit>().createParent(parent);

                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Create Parent Account"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  Widget _selectButton(
      String text, String selectedValue, Function(String) onTap) {

    final bool isSelected = text == selectedValue;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () => onTap(text),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.secondary : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.secondary),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
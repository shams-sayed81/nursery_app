import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_text_feild.dart';
import '../data/models/user_model.dart';
import '../manager/admin_cubit.dart';

class CreateEditUserDialog extends StatefulWidget {
  final UserModel? user;

  const CreateEditUserDialog({super.key, this.user});

  @override
  State<CreateEditUserDialog> createState() => _CreateEditUserDialogState();
}

class _CreateEditUserDialogState extends State<CreateEditUserDialog> {

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final avatarController = TextEditingController();

  String? selectedRole;

  final roles = ["Teacher", "Parent", "Admin"];

  bool get isEdit => widget.user != null;

  @override
  void initState() {
    super.initState();

    if (isEdit) {
      nameController.text = widget.user!.fullName;
      passwordController.text = widget.user!.password;
      avatarController.text = widget.user!.avatarUrl ?? "";
      selectedRole = widget.user!.role;
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

            Text(
              isEdit ? "Edit User" : "Create User",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            CustomTextFormField(
              controller: nameController,
              labelText: "Full Name",
              hintText: "Enter full name",
              textInputType: TextInputType.text,
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: selectedRole,
              decoration: const InputDecoration(
                labelText: "Role",
              ),
              items: roles.map((role) {
                return DropdownMenuItem(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedRole = value;
                });
              },
            ),

            const SizedBox(height: 12),

            CustomTextFormField(
              controller: passwordController,
              labelText: "Password",
              hintText: "Enter password",
              textInputType: TextInputType.text,
            ),

            const SizedBox(height: 12),

            CustomTextFormField(
              controller: avatarController,
              labelText: "Avatar URL (optional)",
              hintText: "https://image.com/avatar.png",
              textInputType: TextInputType.text,
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  final cubit = context.read<AdminCubit>();

                  if (isEdit) {

                    cubit.updateUser(
                      widget.user!.copyWith(
                        fullName: nameController.text,
                        role: selectedRole,
                        password: passwordController.text,
                        avatarUrl: avatarController.text.isEmpty
                            ? null
                            : avatarController.text,
                      ),
                    );

                  } else {

                    cubit.addUser(
                      UserModel(
                        id: DateTime.now().toString(),
                        fullName: nameController.text,
                        role: selectedRole!,
                        password: passwordController.text,
                        avatarUrl: avatarController.text.isEmpty
                            ? null
                            : avatarController.text,
                      ),
                    );
                  }

                  Navigator.pop(context);
                },
                child: Text(isEdit ? "Save Changes" : "Create User"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
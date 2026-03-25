import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../manager/admin_cubit.dart';
import '../widgets/create_user_diaog.dart';
import 'management_view.dart';

class UsersManagementView extends StatefulWidget {
  const UsersManagementView({super.key});
  static const String routeName = '/user-management';

  @override
  State<UsersManagementView> createState() => _UsersManagementViewState();
}

class _UsersManagementViewState extends State<UsersManagementView> {

  String searchQuery = "";
  String selectedRole = "All";

  @override
  void initState() {
    super.initState();
    context.read<AdminCubit>().loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    final s= S.of(context);
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        if (state is! AdminUsersLoaded) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final users = state.users;
        final cubit = context.read<AdminCubit>();

        final teachers = users.where((u) => u.role == "Teacher").length;
        final parents = users.where((u) => u.role == "Parent").length;
        final admins = users.where((u) => u.role == "Admin").length;

        /// FILTER
        final filteredUsers = users.where((user) {
          final matchesSearch =
          user.fullName.toLowerCase().contains(searchQuery.toLowerCase());

          final matchesRole =
              selectedRole == "All" || user.role == selectedRole;

          return matchesSearch && matchesRole;
        }).toList();


        return ManagementView(
          title: s.users_management,
          items: filteredUsers,

          stats: [
            StatModel(
              title: s.total_users,
              value: users.length.toString(),
              icon: Icons.people,
              color: Colors.blue,
            ),
            StatModel(
              title: s.teachers,
              value: teachers.toString(),
              icon: Icons.school,
              color: Colors.purple,
            ),
            StatModel(
              title: s.parents,
              value: parents.toString(),
              icon: Icons.family_restroom,
              color: Colors.green,
            ),
            StatModel(
              title:s.admins,
              value: admins.toString(),
              icon: Icons.admin_panel_settings,
              color: Colors.orange,
            ),
          ],

          showSearch: true,
          showFilter: true,
          filterItems:  [s.all, s.teacher, s.parent, s.admin_role],

          onSearch: (value) {
            setState(() => searchQuery = value);
          },

          onFilter: (value) {
            setState(() => selectedRole = value);
          },

          onCreatePressed: () {
            showDialog(
              context: context,
              builder: (_) => const CreateEditUserDialog(

              ),
            );
          },

          itemBuilder: (context, user) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: user.avatarUrl != null
                        ? NetworkImage(user.avatarUrl!)
                        : null,
                    child: user.avatarUrl == null
                        ? const Icon(Icons.person)
                        : null,
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.fullName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(user.role),
                      ],
                    ),
                  ),

                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => CreateEditUserDialog(user: user),
                      );
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      cubit.deleteUser(user.id);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
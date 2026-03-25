import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/core/theme/app_colors.dart';

import '../manager/admin_cubit.dart';

import '../../parent/data/models/parent_model.dart';
import '../../parent/data/models/child_model.dart';


class ParentsView extends StatefulWidget {
  const ParentsView({super.key});
  static const String routeName='/parents-view';

  @override
  State<ParentsView> createState() => _ParentsViewState();
}

class _ParentsViewState extends State<ParentsView> {
  @override
  void initState() {
    super.initState();
    context.read<AdminCubit>().loadParents();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        final parents = context.read<AdminCubit>().parents;
return Scaffold(
appBar:  AppBar(

),
  backgroundColor: AppColors.primary,
  body: parents.isEmpty? const Center(child: Text("No Parents Yet")):
  ListView.builder(
    padding: const EdgeInsets.all(12),
    itemCount: parents.length,
    itemBuilder: (context, index) {
      return ParentAccountCard(parent: parents[index]);
    },
  ),
);


      },
    );
  }
}


class ParentAccountCard extends StatelessWidget {
  final ParentModel parent;

  const ParentAccountCard({
    super.key,
    required this.parent,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AdminCubit>();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔹 Header
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFF00A8A8),
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  parent.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              IconButton(
                onPressed: () {
                  cubit.parents.remove(parent);
                  cubit.emit(AdminParentsLoaded(List.from(cubit.parents)));
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              )
            ],
          ),

          const SizedBox(height: 10),

          /// 🔹 Email
          Row(
            children: [
              const Icon(Icons.email, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(parent.email),
            ],
          ),

          const SizedBox(height: 6),

          /// 🔹 Password
          Row(
            children: [
              const Icon(Icons.lock, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text("Password: ${parent.password}"),
            ],
          ),

          const SizedBox(height: 12),

          /// 🔹 Children Title
          Text(
            "Children (${parent.children.length})",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 8),

          /// 🔹 Children List
          Column(
            children: parent.children.map((child) {
              return ChildItem(child: child);
            }).toList(),
          ),

          const SizedBox(height: 10),

          /// 🔹 Active Box
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Active Account - ${parent.email}",
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class ChildItem extends StatelessWidget {
  final ChildModel child;

  const ChildItem({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                child: Text(
                  child.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("${child.age} years"),
              )
            ],
          ),

          const SizedBox(height: 6),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Class: ${child.className}"),
              Text("Year: ${child.year}"),
            ],
          ),

          const SizedBox(height: 4),

          Text("Religion: ${child.religion}"),
        ],
      ),
    );
  }
}
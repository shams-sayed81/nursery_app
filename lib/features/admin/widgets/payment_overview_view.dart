import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/admin_cubit.dart';
import '../../parent/data/models/child_model.dart';
import '../views/management_view.dart';

class StudentPaymentView extends StatefulWidget {
  const StudentPaymentView({super.key});

  @override
  State<StudentPaymentView> createState() => _StudentPaymentViewState();
}

class _StudentPaymentViewState extends State<StudentPaymentView> {
  String searchQuery = "";
  String selectedStatus = "All Students";

  @override
  void initState() {
    super.initState();
    context.read<AdminCubit>().loadChildren();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        if (state is! AdminChildrenLoaded) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final children = state.children;

        /// 🔹 FILTER
        final filtered = children.where((child) {
          final matchesSearch =
          child.name.toLowerCase().contains(searchQuery.toLowerCase());

          final status = _getStatusLabel(
              child.paymentStatus ?? PaymentStatus.noPlan);

          final matchesStatus =
              selectedStatus == "All Students" || status == selectedStatus;

          return matchesSearch && matchesStatus;
        }).toList();

        /// 🔹 STATS
        final expected = children.fold<double>(
          0,
              (sum, c) => sum + (c.total ?? 0),
        );

        final collected = children.fold<double>(
          0,
              (sum, c) => sum + (c.paid ?? 0),
        );

        final overdueCount = children
            .where((c) => c.paymentStatus == PaymentStatus.overdue)
            .length;

        final noPlanCount = children
            .where((c) => c.paymentStatus == PaymentStatus.noPlan)
            .length;

        return ManagementView<ChildModel>(
          showCreateButton: false,
          title: '',
          items: filtered,

          /// 🔹 STATS
          stats: [
            StatModel(
              title: "Expected",
              value: "\$${expected.toInt()}",
              icon: Icons.attach_money,
              color: Colors.blue,
            ),
            StatModel(
              title: "Collected",
              value: "\$${collected.toInt()}",
              icon: Icons.payments,
              color: Colors.green,
            ),
            StatModel(
              title: "Overdue",
              value: overdueCount.toString(),
              icon: Icons.warning,
              color: Colors.red,
            ),
            StatModel(
              title: "No Plan",
              value: noPlanCount.toString(),
              icon: Icons.info,
              color: Colors.orange,
            ),
          ],

          showSearch: true,
          showFilter: true,
          filterItems: const [
            "All Students",
            "Pending",
            "Overdue",
            "Fully Paid",
            "No Plan",
          ],

          onSearch: (value) {
            setState(() => searchQuery = value);
          },

          onFilter: (value) {
            setState(() => selectedStatus = value);
          },

          onCreatePressed: () {},

          /// 🔥 ITEM CARD
          itemBuilder: (context, child) {
            final paid = child.paid ?? 0;
            final total = child.total ?? 0;
            final status =
                child.paymentStatus ?? PaymentStatus.noPlan;

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  /// Avatar
                  CircleAvatar(
                    child: Text(child.name[0]),
                  ),

                  const SizedBox(width: 10),

                  /// Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          child.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text("Total: \$$total | Paid: \$$paid"),
                      ],
                    ),
                  ),

                  /// Status
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(status).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _getStatusLabel(status),
                      style: TextStyle(
                        color: _getStatusColor(status),
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  /// Remind button
                  if (status != PaymentStatus.fullyPaid)
                    OutlinedButton(
                      onPressed: () {
                      },
                      child: const Text("Remind"),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  /// 🔹 label
  String _getStatusLabel(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.pending:
        return "Pending";
      case PaymentStatus.overdue:
        return "Overdue";
      case PaymentStatus.fullyPaid:
        return "Fully Paid";
      case PaymentStatus.noPlan:
        return "No Plan";
    }
  }

  /// 🔹 color
  Color _getStatusColor(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.pending:
        return Colors.blue;
      case PaymentStatus.overdue:
        return Colors.red;
      case PaymentStatus.fullyPaid:
        return Colors.green;
      case PaymentStatus.noPlan:
        return Colors.orange;
    }
  }
}
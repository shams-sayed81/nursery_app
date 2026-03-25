import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/features/parent/ui/widgets/payment_card.dart';
import 'package:gym_app/features/parent/ui/widgets/tuition_header_card.dart';

class TuitionScreen extends StatelessWidget {
  const TuitionScreen({super.key});
  static const String routeName='/tuition';

  @override
  Widget build(BuildContext context) {
    final payments = [
      PaymentModel(
        amount: "\$500",
        dueDate: "Due August",
        isPaid: false,
      ),
      PaymentModel(
        amount: "\$10,000",
        dueDate: "Due December",
        isPaid: false,
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar( backgroundColor: AppColors.primary,),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),

            const TuitionHeaderCard(
              totalAmount: "\$10,500",
              paidStatus: "0 / 2 Paid",
            ),

            SizedBox(height: 20.h),

            Text(
              "Payment Schedule",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 12.h),

            Expanded(
              child: ListView.separated(
                itemCount: payments.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  return PaymentCard(payment: payments[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
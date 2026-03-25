import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:intl/intl.dart';

import '../../../../generated/l10n.dart';
import '../../manager/child_cubit.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<ChildCubit, int>(
      builder: (context, state) {
        final cubit = context.read<ChildCubit>();
        final photos = cubit.getChildPhotos();

        if (photos.isEmpty) {
          return const Center(child: Text("لا توجد صور حالياً"));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              titleSpacing: 0,
              backgroundColor: AppColors.primary,
              title: Text(s.gallery, style: AppTextStyles.font024BlackBold),
              actions: [Icon(Icons.notifications, color: AppColors.grey)],
            ),
            vGap(5),
            Text(
              s.photos_videos_description,
              style: AppTextStyles.font16BlackRegular,
            ),
            vGap(10),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: .9,
                ),
                itemBuilder: (context, index) {
                  final photo = photos[index];

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(photo.imageUrl, fit: BoxFit.cover),
                        vGap(15),
                        Text(photo.caption??'' , style: AppTextStyles.font14BlackRegular,),
                        Text(DateFormat('dd MMM yyyy').format(photo.date)),

                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

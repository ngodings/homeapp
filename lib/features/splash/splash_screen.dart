import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/main_repository.dart';
import '../../utils/assets.dart';
import '../helper/text_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MainRepository(),
      lazy: false,
      child: const _SplashScreen(),
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: 30.sp,
            left: 30.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 177.sp,
                width: 177.sp,
                child:
                    // SvgPicture.asset(AppSvg.youapp)
                    Image.asset(AppImages.splashLogo),
              ).centered().expand(),
              TextWidget(
                      text: 'Product by Lals',
                      textAlign: TextAlign.center,
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -2 / 100)
                  .pOnly(bottom: 20.sp),
            ],
          ),
        ),
      ),
    );
  }
}

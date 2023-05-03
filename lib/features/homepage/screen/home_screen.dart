import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:homeapp/features/homepage/screen/blog_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/colors.dart';
import '../../helper/text_widget.dart';
import '../cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends HookWidget {
  const _HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);
    final selectedIndex = useState(0);
    tabController.addListener(() {
      selectedIndex.value = tabController.index;
    });
    return Scaffold(
      body: VStack([
        Gap(50.h),
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: VStack(
              [
                TabBar(
                  controller: tabController,
                  indicatorColor: goldenTwo[1],
                  tabs: [
                    HStack(
                      [
                        GradientTextWidget(
                          text: "Blogs",
                          gradient:
                              selectedIndex.value == 0 ? goldenTwo : greyed,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.h,
                        ).py4(),
                      ],
                    ),
                    HStack([
                      GradientTextWidget(
                        text: "Candidates",
                        gradient: selectedIndex.value == 1 ? goldenTwo : greyed,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.h,
                      ).py4(),
                    ]),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      const BlogScreen(),
                      Container(
                        color: Colors.green,
                      ),
                      //AddedFromAppTab(),
                      // PhoneContactTab(),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

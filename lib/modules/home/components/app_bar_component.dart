import 'package:corelab_app_challenge/modules/home/components/app_bar_state.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatefulWidget implements PreferredSizeWidget {
  const AppBarComponent({super.key});
  @override
  State<StatefulWidget> createState() => AppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DiscoveryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title, subtitle, leading, trailing;

  const DiscoveryAppBar({
    Key? key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: ListTile(
          title: title,
          subtitle: subtitle,
          leading: leading,
          trailing: trailing,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}

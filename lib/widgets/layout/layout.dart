import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ground_ups/config/colors.dart';
import 'package:ground_ups/widgets/layout/refresh_indicator.dart';

class Layout extends StatelessWidget {
  final List<Widget> body;
  final Widget? bottomNavigationBar;
  final Widget? bottomAppBar;
  final Widget? flexibleSpace;
  final Widget? appBarTitle;
  final double? expandedHeight;
  final List<Widget>? actions;
  final String? flexibleSpaceBarTitle;
  final FloatingActionButton? floatingActionButton;
  final bool? leading;
  final bool? centerTitle;
  final bool? isAppBar;
  final Future Function()? onRefresh;
  final Widget? headerContent;
  final ScrollController? controller;

  const Layout({
    super.key,
    this.isAppBar = true,
    this.centerTitle = false,
    this.bottomNavigationBar,
    this.expandedHeight,
    this.actions,
    this.floatingActionButton,
    this.bottomAppBar,
    this.flexibleSpaceBarTitle,
    this.flexibleSpace,
    this.leading = true,
    required this.body,
    this.appBarTitle,
    this.controller,
    this.onRefresh,
    this.headerContent,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: primary,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.dark,
      ),
    );
    if (onRefresh != null) {
      return SafeArea(
        child: Scaffold(
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: SizedBox(
            width: 64,
            height: 64,
            child: floatingActionButton,
          ),
          body: RefreshWidget(
            onRefresh: onRefresh,
            child: CustomScrollView(
              controller: controller,
              slivers: <Widget>[
                if (isAppBar!)
                  SliverAppBar(
                    centerTitle: centerTitle,
                    backgroundColor:
                        flexibleSpace != null ? backgroundColor : Colors.white,
                    floating: true,
                    pinned: true,
                    snap: bottomAppBar != null,
                    automaticallyImplyLeading: false,
                    title: flexibleSpace != null ? Container() : appBarTitle,
                    leading: leading == true
                        ? Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 15,
                              bottom: 10,
                              right: 5,
                            ),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.08),
                                    blurRadius: 12.3636,
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: info.shade50.withOpacity(.5),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: info,
                                    size: 21,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : null,
                    expandedHeight: expandedHeight ??
                        (flexibleSpace != null
                            ? 275.0
                            : flexibleSpace == null && bottomAppBar == null
                                ? 0
                                : 130),
                    actions: actions,
                    /*shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),*/
                    flexibleSpace: flexibleSpace ?? Container(),
                    bottom: bottomAppBar != null
                        ? PreferredSize(
                            preferredSize: const Size(0.0, 60.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: const BoxDecoration(),
                                child: bottomAppBar,
                              ),
                            ),
                          )
                        : null,
                  ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [...body],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: SizedBox(
          width: 64,
          height: 64,
          child: floatingActionButton,
        ),
        body: CustomScrollView(
          controller: controller,
          slivers: <Widget>[
            if (isAppBar!)
              SliverAppBar(
                centerTitle: centerTitle,
                backgroundColor:
                    flexibleSpace != null ? backgroundColor : Colors.white,
                floating: true,
                pinned: true,
                snap: bottomAppBar != null,
                automaticallyImplyLeading: false,
                title: flexibleSpace != null ? Container() : appBarTitle,
                leading: leading == true
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 15,
                          bottom: 10,
                          right: 5,
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.08),
                                blurRadius: 12.3636,
                              ),
                            ],
                          ),
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: info.shade50.withOpacity(.5),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: info,
                                size: 21,
                              ),
                            ),
                          ),
                        ),
                      )
                    : null,
                expandedHeight: expandedHeight ??
                    (flexibleSpace != null
                        ? 275.0
                        : flexibleSpace == null && bottomAppBar == null
                            ? 0
                            : 130),
                actions: actions,
                /*shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),*/
                flexibleSpace: flexibleSpace ?? Container(),
                bottom: bottomAppBar != null
                    ? PreferredSize(
                        preferredSize: const Size(0.0, 60.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 16,
                            ),
                            padding: const EdgeInsets.only(left: 16),
                            decoration: const BoxDecoration(
                              color: backgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: bottomAppBar,
                          ),
                        ),
                      )
                    : null,
              ),
            SliverList(
              delegate: SliverChildListDelegate([
                SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [...body],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

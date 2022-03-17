import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:restaurant/component/alert.dart';
import 'package:restaurant/component/loading.dart';
import 'package:restaurant/model/StoreModel.dart';
import 'package:restaurant/screens/employer/Addshop.dart';
import 'package:restaurant/screens/login/Signin.dart';
import 'package:restaurant/services/StoreService.dart';

import 'component/WillPop.dart';
import 'component/detail.dart';
import 'model/SearchModel.dart';
import 'theme/Style.dart';
import 'transition_route_observer.dart';
import 'widgets/fade_in.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/dashboard';
  final type;
  final username;
  final iduser;
  MyHomePage(this.type, this.username, this.iduser);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  final routeObserver = TransitionRouteObserver<PageRoute>();
  static const headerAniInterval = Interval(.1, .3, curve: Curves.easeOut);
  Animation<double> _headerScaleAnimation;
  AnimationController _loadingController;

  @override
  void initState() {
    super.initState();

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );

    _headerScaleAnimation =
        Tween<double>(begin: .6, end: 1).animate(CurvedAnimation(
      parent: _loadingController,
      curve: headerAniInterval,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _loadingController.dispose();
    super.dispose();
  }

  @override
  void didPushAfterTransition() => _loadingController.forward();

  AppBar _buildAppBar(ThemeData theme) {
    final menuBtn = IconButton(
      color: theme.colorScheme.secondary,
      icon: const Icon(Icons.bar_chart),
      onPressed: () {},
    );
    final signOutBtn = IconButton(
      icon: const Icon(Icons.arrow_forward_ios_outlined),
      color: theme.colorScheme.secondary,
      onPressed: () => _goToLogin(context),
    );
    final title = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[],
      ),
    );

    return AppBar(
      leadingWidth: 150,
      leading: Center(
        child: FadeIn(
          controller: _loadingController,
          offset: .3,
          curve: headerAniInterval,
          fadeDirection: FadeDirection.startToEnd,
          child: widget.type == "none"
              ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    },
                    child: Text("เข้าสู่ระบบ"),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("บัญชี: " + widget.username),
                            actions: [
                              FlatButton(
                                child: Text("ตกลง"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
        ),
      ),
      actions: <Widget>[
        FadeIn(
          controller: _loadingController,
          offset: .3,
          curve: headerAniInterval,
          fadeDirection: FadeDirection.endToStart,
          child: signOutBtn,
        ),
      ],
      title: title,
      backgroundColor: theme.primaryColor.withOpacity(.1),
      elevation: 0,
    );
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return isLoading
        ? LoadingDoubleBounce()
        : WillPopScope(
            onWillPop: () => _goToLogin(context),
            child: Scaffold(
              appBar: _buildAppBar(theme),
              body: Material(
                color: kPrimaryColor,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 90,
                            child: TypeAheadField<User>(
                              hideSuggestionsOnKeyboardHide: false,
                              textFieldConfiguration: TextFieldConfiguration(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  hintText: 'ค้นหาที่นี่',
                                ),
                              ),
                              suggestionsCallback: UserApi.getUserSuggestions,
                              itemBuilder: (context, User suggestion) {
                                var temp;
                                if (suggestion?.company != "") {
                                  temp = ListTile(
                                    title: Text(suggestion?.company),
                                  );
                                } else {
                                  temp = Container(child: null);
                                }
                                return temp;
                              },
                              noItemsFoundBuilder: (context) => Container(
                                height: 60,
                                child: Center(
                                  child: Text(
                                    'ค้าหาไม่เจอ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              onSuggestionSelected: (User suggestion) {
                                final user = suggestion;
                                if (user?.image == "") {
                                  // img = DefaultImage;
                                } else {
                                  // img = user?.image;
                                }
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => DetailsPage(
                                //             img, user.id, token, typeUser)));

                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(SnackBar(
                                    content:
                                        Text('เลือกบริษัท: ${user.company}'),
                                  ));
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Navigator.push(context,MaterialPageRoute(builder: (context) => MapJob(token , typeUser)));
                            },
                            icon: Icon(Icons.search, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    FutureBuilder(
                      future: get_Store(),
                      builder: (context, AsyncSnapshot snapshot) {
                        List result = [];
                        List store = [];
                        if (snapshot?.connectionState != ConnectionState.done) {
                          return Container(
                            height: size.height * 0.815,
                            child: LoadingDoubleBounce(),
                          );
                        } else {
                          for (StoreModel data in snapshot?.data) {
                            if (data.idstore == widget.iduser) {
                              store.add(
                                detail(
                                    data.id,
                                    data.address,
                                    data.idstore,
                                    data.image,
                                    data.latitude,
                                    data.longitude,
                                    data.name,
                                    data.open,
                                    data.tel,
                                    data.totalReview,
                                    data.website,
                                    widget.type,
                                    widget.iduser,
                                    widget.username),
                              );
                            }
                            if (data.name != "" && data.image != "") {
                              result.add(
                                detail(
                                    data.id,
                                    data.address,
                                    data.idstore,
                                    data.image,
                                    data.latitude,
                                    data.longitude,
                                    data.name,
                                    data.open,
                                    data.tel,
                                    data.totalReview,
                                    data.website,
                                    widget.type,
                                    widget.iduser,
                                    widget.username),
                              );
                            }
                          }
                        }
                        return Column(
                          children: [
                            store.length == 0
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "ข้อมูลร้าน",
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 110,
                                          child: ListView.builder(
                                            itemCount: store?.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  store[index],
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "รวมร้านคาเฟ่",
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      widget.type == "employer" &&
                                              store.length == 0
                                          ? InkWell(
                                              onTap: () async {
                                                setState(() {
                                                  isLoading = true;
                                                });
                                                final String result =
                                                    await add_Store(
                                                        widget.iduser);
                                                if (result == "true") {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              EmployerPage(
                                                                  "",
                                                                  "",
                                                                  widget.iduser,
                                                                  "",
                                                                  "",
                                                                  "",
                                                                  "",
                                                                  "",
                                                                  "",
                                                                  "",
                                                                  "",
                                                                  widget.type,
                                                                  widget.iduser,
                                                                  widget
                                                                      .username)));
                                                } else {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                  showDialog(
                                                    context: context,
                                                    builder: (_) =>
                                                        AlertMessage(
                                                      "แจ้งเตือน",
                                                      "เซิฟเวอร์ขัดข้องกรุณาลองใหม่ภายหลัง",
                                                      null,
                                                    ),
                                                  );
                                                }
                                              },
                                              child: Icon(
                                                Icons
                                                    .add_circle_outline_outlined,
                                                size: 30,
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                  Container(
                                    height: 110,
                                    child: ListView.builder(
                                      itemCount: result?.length,
                                      itemBuilder: (context, index) {
                                        return SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              result[index],
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

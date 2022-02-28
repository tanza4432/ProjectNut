import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:restaurant/component/alert.dart';
import 'package:restaurant/dashboard.dart';

class MapShow extends StatefulWidget {
  // MapShow(this.token, this.typeUser);
  // var token;
  // var typeUser;
  @override
  _MapShowState createState() => _MapShowState();
}

class _MapShowState extends State<MapShow> {
  // _MapShowState(this.token, this.typeUser);
  // var token;
  // var typeUser;
  Position userLocation;
  GoogleMapController mapController;

  // LocationJobModel _datadetail = LocationJobModel(
  //   image: "",
  //   province: "",
  //   subDistrict: "",
  //   jobId: "",
  //   company: "",
  //   district: "",
  // );

  // LocationJobModel _sourcePinInfo;

  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  double _pinPillPosition = -100;

  Future<void> getPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);

    if (permission == PermissionStatus.denied) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.locationAlways]);
    }

    var geolocator = Geolocator();

    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();
    switch (geolocationStatus) {
      case GeolocationStatus.denied:
        _getLocation();
        break;
      case GeolocationStatus.disabled:
        showDialog(
          context: context,
          builder: (_) => AlertMessage("แจ้งเตือน", "ตำแหน่งถูกปิดอยู่", null),
        );
        Navigator.pop(context);
        break;
      case GeolocationStatus.restricted:
        showDialog(
          context: context,
          builder: (_) => AlertMessage("แจ้งเตือน", "การอนุญาติถูกจำกัด", null),
        );
        Navigator.pop(context);
        break;
      case GeolocationStatus.unknown:
        showDialog(
          context: context,
          builder: (_) => AlertMessage("แจ้งเตือน", "ไม่พบตำแหน่ง", null),
        );
        Navigator.pop(context);
        break;
      case GeolocationStatus.granted:
        _getLocation();
        break;
    }
  }

  @override
  void initState() {
    getPermission();
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) async {
    userLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    // List<LocationJobModel> data = await GetLocationJob(
    //     userLocation.latitude.toString(), userLocation.longitude.toString());
    // for (LocationJobModel item in data) {
    //   if (item?.image == "") {
    //     // item?.image = DefaultImage;
    //   }
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("item.company"),
            position: LatLng(16.723086, 101.750202),
            onTap: () {
              setState(() {
                // _datadetail = item;
                _pinPillPosition = 40;
              });
            }),
      );
    });
    // }
    mapController = controller;
  }

  Future<Position> _getLocation() async {
    try {
      userLocation = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      userLocation = null;
    }
    return userLocation;
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: _getLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Stack(
                children: <Widget>[
                  GoogleMap(
                    mapType: MapType.normal,
                    onMapCreated: _onMapCreated,
                    markers: _markers,
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                            userLocation.latitude, userLocation.longitude),
                        zoom: 15),
                    tiltGesturesEnabled: true,
                    onTap: (LatLng location) {
                      setState(() {
                        _pinPillPosition = -100;
                      });
                    },
                  ),
                  AnimatedPositioned(
                    bottom: _pinPillPosition,
                    right: 0,
                    left: 0,
                    duration: Duration(milliseconds: 200),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.all(20),
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                blurRadius: 20,
                                offset: Offset.zero,
                                color: Colors.grey.withOpacity(0.5),
                              )
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  GotoDetail();
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  color: Colors.white,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [_buildLocationInfo()]),
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Container(),
            );
          }
        },
      ),
    );
  }

  void GotoDetail() async {
    setState(() => loading = true);
    // JobDataModel find = await TopicWorkFindJob_ID(_datadetail.jobId);
    // if (find?.image == "") {
    //   find.image = DefaultImage;
    // }
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) =>
    //         DetailsPage(find.image, find.id, token, typeUser),
    //   ),
    // );
    setState(() => loading = false);
  }

  Widget _buildLocationInfo() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.red,
                // image: DecorationImage(
                //     image: NetworkImage(_datadetail.image), fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "ชื่อร้าน",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "ดูรายละเอียดเพิ่มเติม... ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:tutor/pages/tutorlist.dart';

import '../pages/myaccount.dart';
import '../pages/myorder.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => tutorlist();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield tutorlist();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield myAccount();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield myOrder();
        break;
    }
  }
}

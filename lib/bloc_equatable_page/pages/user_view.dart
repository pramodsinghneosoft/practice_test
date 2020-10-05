import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_test/bloc_equatable_page/bloc/userbloc_bloc.dart';
import 'package:sqflite_test/bloc_equatable_page/model/user_model.dart';
import 'package:sqflite_test/bloc_equatable_page/pages/border_box_view.dart';

class UserDataView extends StatefulWidget {
  @override
  _UserDataViewState createState() => _UserDataViewState();
}

class _UserDataViewState extends State<UserDataView> {
  @override
  void initState() {
    // ignore: close_sinks
    final userbloc = BlocProvider.of<UserblocBloc>(context);
    userbloc.add(GetUserEvent());
    // userbloc.add(GetPostsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Bloc View",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          BorderBox(
            child: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            height: 50,
            width: 50,
          )
        ],
      ),
      body: Container(child: BlocBuilder<UserblocBloc, UserblocState>(
        builder: (context, state) {
          if (state is UserblocInitial) {
            return Center(child: Text(""));
          } else if (state is UserblocLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserblocLoaded) {
            return _buildListwidget(context, state.userModel);
          } else if (state is UserblocError) {
            return Text(state.message);
          } else {
            return Container();
          }
        },
      )),
    );
  }

  Widget _buildListwidget(context, List<UserModel> userData) {
    return ListView.builder(
        itemCount: getUserLength(userData),
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              child: Text(
                userData[index].name,
                // ignore: deprecated_member_use
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .merge(TextStyle(color: Colors.grey, fontSize: 16)),
              ),
            ),
          );
        });
  }

  int getUserLength(userData) {
    if (userData != null) {
      if (userData.length != 0) {
        return userData.length;
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  }
}

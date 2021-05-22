import 'package:bloc/bloc.dart';
import 'package:lab05/Event/user_event.dart';
import 'package:lab05/Models/generic_data.dart';
import 'package:lab05/Models/user.dart';
import 'package:lab05/Models/newUser.dart';
import 'package:lab05/Repos/userRepo.dart';

class UserBloc extends Bloc<UserEvents,GeneralState<UsersListState>>{
  //UserBloc(GeneralState<UsersListState> initialState) : super(GeneralState());
  UserBloc() : super(GeneralState());

  @override
  Stream<GeneralState<UsersListState>> mapEventToState(UserEvents event) async* {
    if(event is UserList){
      try{
        yield GeneralState(waiting: true);
        List<User> usersList = await UserRepo().getUsers();
        GeneralState<UsersListState> newState = GeneralState(
          data: UsersListState(usersList: usersList),
          hasData: true
        );
        yield newState;
      }
      catch(error){
        yield GeneralState(hasError: true, error: error.toString());
      }

    }
    else if(event is SingleUser){
      GeneralState<UsersListState> newState = GeneralState(
        data: UsersListState(usersList: state.data.usersList),
        hasData: true
      );
      newState.data.selectedUser = state.data.usersList.
      firstWhere((element) => element.id == event.selectedUserId);
      yield newState;
    }
    else if(event is AddUser){
      try{
        yield GeneralState(waiting: true);
        NewUser newUser = await UserRepo().addUser(event.name, event.job);
        GeneralState<UsersListState> newState = GeneralState(
            data: UsersListState(newUser: newUser),
            hasData: true
        );
        yield newState;
      }
      catch(error){
        yield GeneralState(hasError: true, error: error.toString());
      }
    }
  }

}

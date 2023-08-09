import 'package:mobx/mobx.dart';
import 'package:rei_da_bola/app/modules/shared/models/soccer_match_model.dart';
import 'package:rei_da_bola/shared/api/state_response.dart';
import '../../../../../shared/format_date_time.dart';
import '../../../../../shared/token/token_manager.dart';
import '../services/round_today_service.dart';

part 'round_today_controller.g.dart';

class RoundTodayController = RoundTodayControllerImpl with _$RoundTodayController;

abstract class RoundTodayControllerImpl with Store{

  @observable
  String stateController = StateResponse.start;

  @observable
  String token = '';

  @observable
  SoccerMatchModel round = SoccerMatchModel();

  @observable
  RoundTodayServices roundTodayServices = RoundTodayServices();

  @action
  Future<SoccerMatchModel> roundToday(String token, String today) async {
    SoccerMatchModel retorno = SoccerMatchModel();
    stateController = StateResponse.loading;
    try {
      retorno = await roundTodayServices.getRoundToday(token, today);
      stateController = StateResponse.sucess;
    } catch (e) {
      stateController = StateResponse.error;
    }
    return retorno; 
  }

  @action
  Future<void> initRoundToday() async {
    DateFormateAppDefault data = DateFormateAppDefault();
    TokenManager tokenManager = TokenManager();
    String? token = await tokenManager.getToken();
    if(token != null){
      String today = data.formatDateToday(DateTime.now());
      round = await roundToday(token, today);
    }
  }
}
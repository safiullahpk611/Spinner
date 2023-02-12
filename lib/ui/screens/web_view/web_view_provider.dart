
import '../../../core/enums/view_state.dart';
import '../../../core/models/base_view_model.dart';


class WebViewProvider extends BaseViewModal {
  void idle() {
    setState(ViewState.idle);
  }

  void busy() {
    setState(ViewState.busy);
  }
}

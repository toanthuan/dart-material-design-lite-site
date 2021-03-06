import "dart:html" as dom;

import 'package:console_log_handler/console_log_handler.dart';
import 'package:dryice/dryice.dart';

import 'package:mdl/mdl.dart';
import 'main.reflectable.dart';

@Component @inject
class Application implements MaterialApplication {
    // final Logger _logger = new Logger('main.Application');

    /// Added by the MDL/Dart-Framework (mdlapplication.dart)
    // final ActionBus _actionbus;

    Application(/* this._actionbus */) {
    }

    @override
    void run() {
        _bindSignals();
    }

    //- private -----------------------------------------------------------------------------------

    /// Add your actions / events you want to listen to
    void _bindSignals() {

        // _actionbus.on(<Action>.NAME).listen((_) {
        //    _logger.info("User clicked on 'Add'!");
        // });

        final MaterialSpinner spinner = MaterialSpinner.widget(dom.querySelector("#first"));
        final MaterialButton button = MaterialButton.widget(dom.querySelector("#button"));

        button.onClick.listen((_) {
            spinner.active = !spinner.active;
        });

    }

}

main() async {
    configLogging();
    initializeReflectable();

    registerMdl();

    final Application application = await componentFactory()
        .rootContext(Application)
        .addModule(new SampleModule())
        .run();

    application.run();
}

/**
 * Application-Config via DI
 */
class SampleModule extends Module {
    configure() {
    }
}

# method_channels_flutter

  static const channel =MethodChannel("SKS");

class _MyHomePageState extends State<MyHomePage> {

  static const channel =MethodChannel("SKS");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Call Native code to show toast message:',
            ),
            ElevatedButton(
              onPressed: _showToast,
              child: const Text("Show toast"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showToast() async {
    final int showToast = await channel.invokeMethod('showToast',<String,String>{
      'msg':"this is a toast from flutter to android native"
    });
  }
}



 private val CHANNEL = "SKS"
    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler { call, _ ->

            var argument =call.arguments<Map<String,String>>()
            var message = argument?.get("msg")

            if (call.method == "showToast") {
                Toast.makeText(context, message, Toast.LENGTH_SHORT).show()
            }
        }
    }

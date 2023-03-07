# webview - documentação PT_BR

1. Instalando um WebViewController:
```
controller = WebViewController()
..setJavaScriptMode(JavaScriptMode.unrestricted)
..setBackgroundColor(const Color(0x00000000))
..setNavigationDelegate(
    NavigationDelegate(
    onProgress: (int progress) {
        // Update loading bar.
    },
    onPageStarted: (String url) {},
    onPageFinished: (String url) {},
    onWebResourceError: (WebResourceError error) {},
    onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
        return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
    },
    ),
)
..loadRequest(Uri.parse('https://flutter.dev'));
 ```

2. Usando o Controller:
```
WebViewWidget(controller: controller)
```

3. Verificar se minSdkVersion é >= 19:

 | path: android/app/build.gradle

```
defaultConfig {
    minSdkVersion 19
} 
```

4. Para acessar serviços especificos

Import for Android features.
```
import 'package:webview_flutter_android/webview_flutter_android.dart';
```
Import for iOS features.
```
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
```

## 🤦‍♂️ Migração 3.0 para 4.0

 | Na versão 3.0 e abaixo, WebViewControllersó poderia ser recuperado em um retorno de chamada depois que WebViewfosse adicionado à árvore de widgets. Agora, WebViewControllerdeve ser instanciado e pode ser usado antes de ser adicionado à árvore de widgets. Consulte Usagea seção acima para obter um exemplo.


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

 > path: android/app/build.gradle

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

 > Na versão 3.0 e abaixo, WebViewControllersó poderia ser recuperado em um retorno de chamada depois que WebViewfosse adicionado à árvore de widgets. Agora, WebViewControllerdeve ser instanciado e pode ser usado antes de ser adicionado à árvore de widgets. Consulte Usagea seção acima para obter um exemplo.

 > A WebViewclasse foi removida e sua funcionalidade foi dividida em WebViewController e WebViewWidget. 
 
 > WebViewWidgetpega WebViewControllere lida com todas as funcionalidades relacionadas ao widget Flutter (por exemplo, direção do layout, reconhecedores de gestos).
 
## ⚙️ Alterações

Abaixo está uma lista não exaustiva de mudanças na API:

 -``` ```WebViewController.clearCache``` não limpa mais o armazenamento local. Por favor, use ```WebViewController.clearLocalStorage```.
 - ```WebViewController.clearCache``` no longer reloads the page.
 - ```WebViewController.loadUrl``` has been removed. Please use ```WebViewController.loadRequest```.
 - ```WebViewController.evaluateJavascript``` has been removed. Please use WebViewController.runJavaScript or ```WebViewController.runJavaScriptReturningResult```.
 - ```WebViewController.getScrollX``` and WebViewController.getScrollY have been removed and have been replaced by ```WebViewController.getScrollPosition```.
 - ```WebViewController.runJavaScriptReturningResult``` now returns an Object and not a String. This will attempt to return a bool or num if the return value can ```be parsed```.
 - ```CookieManager is``` replaced ```by WebViewCookieManager```.
 - ```NavigationDelegate.onWebResourceError``` callback includes errors that are not from the main frame. Use the WebResourceError.isForMainFrame field to filter errors.
 > The following fields from WebView have been moved to NavigationDelegate. They can be added to a WebView with ```WebViewController.setNavigationDelegate```.
 - ```WebView.navigationDelegate``` -> ```NavigationDelegate.onNavigationRequest```
 - ```WebView.onPageStarted``` -> ```NavigationDelegate.onPageStarted```
 - ```WebView.onPageFinished``` -> ```NavigationDelegate.onPageFinished```
 - ```WebView.onProgress``` -> ```NavigationDelegate.onProgress```
 - ```WebView.onWebResourceError``` -> NavigationDelegate.onWebResourceError
 > The following fields from WebView have been moved ```to WebViewController```:
 - ```WebView.javascriptMode``` -> ```WebViewController.setJavaScriptMode```
 - ```WebView.javascriptChannels``` -> WebViewController.addJavaScriptChannel/```WebViewController.removeJavaScriptChannel```
 - ```WebView.zoomEnabled``` -> ```WebViewController.enableZoom```
 - ```WebView.userAgent``` -> ```WebViewController.setUserAgent```
 - ```WebView.backgroundColor``` -> WebViewController.setBackgroundColor
 > The following features have been moved to an Android implementation class. See section Platform-Specific Features for details on accessing Android platform-```specific features```.
 - ```WebView.debuggingEnabled``` -> static ```AndroidWebViewController.enableDebugging```
 - ```WebView.initialMediaPlaybackPolicy``` -> AndroidWebViewController.setMediaPlaybackRequiresUserGesture
 > The following features have been moved to an iOS implementation class. See section Platform-Specific Features for details on accessing iOS platform-```specific features```.
 - ```WebView.gestureNavigationEnabled``` -> ```WebKitWebViewController.setAllowsBackForwardNavigationGestures```
 - ```WebView.initialMediaPlaybackPolicy``` -> ```WebKitWebViewControllerCreationParams.mediaTypesRequiringUserAction```
 - ```WebView.allowsInlineMediaPlayback``` -> ```WebKitWebViewControllerCreationParams.allowsInlineMediaPlayback```

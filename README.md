# webview - documentação PT_BR

### 1. Instalando um WebViewController:
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

### 2. Usando o Controller:
```
WebViewWidget(controller: controller)
```

### 3. Verificar se minSdkVersion é >= 19:

 > path: android/app/build.gradle

```
defaultConfig {
    minSdkVersion 19
} 
```

### 4. Para acessar serviços especificos

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

 - ```WebViewController.clearCache``` não limpa mais o armazenamento local. Por favor, use ```WebViewController.clearLocalStorage```.
 - ```WebViewController.clearCache``` não recarrega mais a página.
 - ```WebViewController.loadUrl``` foi removido. Por favor, use ```WebViewController.loadRequest```.
 - ```WebViewController.evaluateJavascript``` foi removido. Use WebViewController.runJavaScript or ```WebViewController.runJavaScriptReturningResult```.
 - ```WebViewController.getScrollX``` and ```WebViewController.getScrollY``` foram removidos e substituídos por ```WebViewController.getScrollPosition```.
 - ```WebViewController.runJavaScriptReturningResult``` agora retorna um Object e não um String.  Isso tentará retornar um bool ou num se o valor de retorno puder ser analisado.
 - ```CookieManager ``` é substituído por ```WebViewCookieManager```.
 - ```NavigationDelegate.onWebResourceError``` inclui erros que não são do quadro principal. Use o ```WebResourceError.isForMainFrame``` field to filter errors.
 
 > Os seguintes campos de WebView foram movidos para ```NavigationDelegate```. Eles podem ser adicionados a um WebView com ```WebViewController.setNavigationDelegate```:


 - ```WebView.navigationDelegate``` -> ```NavigationDelegate.onNavigationRequest```
 - ```WebView.onPageStarted``` -> ```NavigationDelegate.onPageStarted```
 - ```WebView.onPageFinished``` -> ```NavigationDelegate.onPageFinished```
 - ```WebView.onProgress``` -> ```NavigationDelegate.onProgress```
 - ```WebView.onWebResourceError``` -> NavigationDelegate.onWebResourceError


 > Os seguintes campos de WebViewforam movidos para ```WebViewController```:


 - ```WebView.javascriptMode``` -> ```WebViewController.setJavaScriptMode```
 - ```WebView.javascriptChannels``` -> WebViewController.addJavaScriptChannel/```WebViewController.removeJavaScriptChannel```
 - ```WebView.zoomEnabled``` -> ```WebViewController.enableZoom```
 - ```WebView.userAgent``` -> ```WebViewController.setUserAgent```
 - ```WebView.backgroundColor``` -> ```WebViewController.setBackgroundColor```
 > Os recursos a seguir foram movidos para uma classe de implementação do Android. Consulte a seção ```Platform-Specific Features``` obter detalhes sobre como acessar os recursos específicos da plataforma Android.


 - ```WebView.debuggingEnabled``` -> static ```AndroidWebViewController.enableDebugging```
 - ```WebView.initialMediaPlaybackPolicy``` -> ```AndroidWebViewController.setMediaPlaybackRequiresUserGesture```.



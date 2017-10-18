# 注册事件

详见`AppDelegate.swift`文件

```swift
// 注册事件
ReactEventManager.shared.addEventHandler(Action: "Test", ReactEvent: TestReactEvent())
```

# 事件处理

详见`TestReactEvent.swift`文件

```swift
class TestReactEvent: ReactEventHandlerProtocol {
  func execute(JsonDict json: NSDictionary, Resolver resovler: RCTPromiseResolveBlock, Rejecter rejecter: RCTPromiseRejectBlock) {
    resovler("Ohhh yeah! TestReactEvent handle \(json) event!");
  }
}
```

* `resovler`：响应给JS的`.then` Block。
* `rejecter`: 响应给JS的`.catch` Block。

# JS调用示例

```JavaScript
testCallNative() {
    let ReactEventInterface = require('react-native').NativeModules.ReactEventInterface;
    let event = {
        'action': 'Test',
        'username': 'XXX'
    };
    ReactEventInterface.sendEvent(JSON.stringify(event))
        .then(
            (result) => {
                console.log(result);
            }
        ).catch(
        (result) => {
            console.warn(result);
        }
    );
}
```
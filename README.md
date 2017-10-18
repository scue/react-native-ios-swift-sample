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

# 详细步骤

* 第一步，创建一个`TestReactEvent`的类，遵循`ReactEventHandlerProtocol`协议

* 第二步，实现协议要求的`execute`方法

* 第三步，在`AppDelegate.swift`注册`TestReactEvent`类的事件，它的Action是`Test`

  这可以你可以随意定制，如选择通讯录`PickContact`对应一个`PickContactReactEvent`等等

* 第四步，在JS调用的时候，创建一个event的字典类型

  指定`'action': 'Test'`，然后调用`ReactEventInterface.sendEvent(JSON.stringify(event)).then().catch()`即可

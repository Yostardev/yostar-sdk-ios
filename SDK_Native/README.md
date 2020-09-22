### 初始化SDK
1. 方法（**YostarSDK**）

    ```
    - (void)yostarInitSDK:(const char *)baseUrl withPayStoreID:(const char *)payStoreId withDebug:(BOOL)isDebug
    ```
2. 参数说明：
    >   **baseUrl**初始化的地址  `https://passport.arknights.global:443`
    >    **payStoreId** 对应的平台，iOS传`appstore`
    >   **isDebug** 是否输出日志

2. 方法内代码解析：

    1. 使用属性存储初始化的参数 `URL`、`payStoreID`
    2. 配置`firebase`
    3. 调用**YostarInit.h**文件中的实例方法**yoInit**
----
1. 方法（**YostarInit.h**）
    ```
    - (void)yoInit:(InitSuccessBlock)success failBlcok:(InitFailBlock)fail
    ```
2. 参数说明：
    > `success` 成功的回调
    > `fail` 失败的回调
3. 方法内代码解析：
    1. 注册推送
    2. 组装参数，调用接口，获取App的配置信息
    3. 处理配置信息  
    是否开启日志，存储`adjust`的token，配置公告，比对版本，初始化`adjust`，存储他`twitter`的信息，添加支付观察者
        





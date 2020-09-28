## Summary
1. [tag 的使用](https://www.jianshu.com/p/154d58451ef7)
2. [私有库更新](https://juejin.im/post/6844903609281282062)
3. [创建SDK](https://juejin.im/post/6844903653715738631)
4. [发布或删除SDK到cocoapods流程](https://www.jianshu.com/p/f0a90a119b98)
5. [手把手教你创建Cocoapods的podspec](https://www.jianshu.com/p/4fabfcd4c2d9)
6. [细说 pod trunk](https://note.leodev.me/2016/04/05/CocoaPods-API-Elaborate-pod-trunk/)

## 常用操作命令
1. 添加`tag`
    ```
       git tag 0.0.1 
    ```
2. 查看本地`tag`
   ```
       git tag
   ```
3. 删除本地`tag`
   ```
       git tag -d 0.0.1
   ```
4. 查看远程`tag`
   ```
       git ls-remote --tag
   ```
5. 删除远程`tag`
   ```
       git push -d origin 0.0.1
   ```
6. 把本地`tag`推送到远程
   ```
       git push origin --tag
   ```
7. 删除`cocoapods`上指定版本的 SDk
   ```
       pod trunk delete sdk 2.1.43
   ```
8. 验证SDK
   ```
       pod spec lint SDK.podspec --skip-import-validation
   ```
9. 提交SDK
   ```
       pod trunk push SDK.podspec --skip-import-validation
   ```
10. 创建`podspec`
    ```
       pod spec create xx
    ```
11. 更新`repo`
    ```
       pod repo update
    ```





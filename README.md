# XYXStatusBarHUD
a simple status bar indicator framework

## 显示成功状态
```objc
[XYXStatusBarHUD showSuccess:@"加载成功!"];
```

## 显示错误状态
```objc
[XYXStatusBarHUD showError:@"加载失败!"];
```

## 显示加载状态
```objc
[XYXStatusBarHUD showLoading:@"正在加载..."];
```

## 显示文字（可包含图片）
```objc
[XYXStatusBarHUD showMessage:@"可自定义图片显示" image:[UIImage imageNamed:@"warning"]];
```

## 隐藏状态栏
```objc
[XYXStatusBarHUD hide];
```


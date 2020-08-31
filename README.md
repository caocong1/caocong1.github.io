目录
[toc]

标题
# 一级标题
## 二级标题
### 三级标题
#### 四级标题
##### 五级标题
###### 六级标题

文本格式
**加粗文本**
*斜体***
***斜体加粗***
<u>下划线</u>
~~删除线~~

分割线
***

引用
>引用，内容如下：
>天气预报

编号
* 第一
* 第二
* 第三

序号
1. 第一
2. 第二
3. 第三

日程
* [ ] apple
* [ ] banana
* [x] lemon

链接
[链接](http://noahai.cn)


表格
|head1|head2|head3|
|-|-|-|
|r1c1|r1c2|r1c3|
|r2c1|r2c2|r2c3|
|r3c1|r3c2|r3c3|

语言
```java
    for(int i=0;i<19;i++)
    {
        System.out.println("Hello World !");
    }
```

数学公式
```math
    e^{i\pi} + 1 = 0
```

流程图
```mermaid
    graph LR
    A[模块A] -->|A1| B(模块B)
    B --> C{判断条件C}
    C -->|条件C1| D[模块D]
    C -->|条件C2| E[模块E]
    C -->|条件C3| F[模块F]
```
```mermaid
    graph TD
    A[模块A] -->|A1| B(模块B)
    B --> C{判断条件C}
    C -->|条件C1| D[模块D]
    C -->|条件C2| E[模块E]
    C -->|条件C3| F[模块F]
```

时序图
```mermaid
    sequenceDiagram
    A->>B: 是否已收到消息？
    B-->>A: 已收到消息
```

甘特图
```mermaid
    gantt
    title 甘特图
    dateFormat YYYY-MM-DD
    section 项目A 
    任务1 :a1, 2018-06-06, 30d
    任务2 :after a1 , 20d
    section 项目B
    任务3 :2018-06-12 , 12d
    任务4 : 24d
```

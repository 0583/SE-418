# illumi_database

* 初始化数据库 

`init_database.sql` 创建表

`insert_data.sql` 灌入示例数据

  * user
    * username (primary)
    * password
  * tag
    * tagid (primary)
    * tagname
  * image
    * imageid (primary)
    * username (foreign)
    * imagecontent (blob)
  * hastag
    * imageid
    * tagid

* color 表尚未创建

* 脚本使用:

```
source [pathname]/init_database.sql

source [pathname]/insert_data.sql
```

* 其他：

  * 数据库中已存在的数据为测试用的假，可以访问

  * user表中的信息可以用来 login

  * register的新用户同样可以使用

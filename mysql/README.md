# illumi_database

* sql脚本：illumi_database.sql
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

* color表尚未创建

* 脚本使用:

```
source [pathname]/illumi_database.sql
```

* 其他：

&emsp;&emsp;数据库中已存在的数据为测试用的假，可以访问

&emsp;&emsp;user表中的信息可以用来 login

&emsp;&emsp;register的新用户同样可以使用

# illumi

## feature1
* login
```
http://localhost:8080/login.html
```
* register
```
http://localhost:8080/register.html
```
> &emsp;没有获得权限的访问(`/register.html` 、`/login.html` 和 `/register` 除外)会被重定向到`/authentication/require` <br />
> &emsp;类似`/*.html`的请求(`/register.html`除外)被重定向到登陆页面<br />
> &emsp;注册后跳转到登陆页面 <br />
> &emsp;登陆后重定向到`/index`(空白页)
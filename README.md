
- **به شدت توصیه می‌شود شتاب‌دهنده BBR را فعال کنید، که می‌تواند سرعت گره‌های Reality و Vmess را به طور قابل توجهی افزایش دهد.**
- پس از تکمیل نصب، می‌توانید با وارد کردن `mianyang` در ترمینال، مجدداً این اسکریپت را فراخوانی کنید.

# **ویژگی‌های جدید (از جدیدترین به قدیمی‌ترین)**

- افزودن امکان جابجایی بین نسخه رسمی و آزمایشی sing-box
- امکان "دروازه‌ای"، پشتیبانی از SS برای بازکردن قفل استریم‌های رسانه‌ای و انتقال از طریق دروازه (فقط در نسخه دوگانه)
- سازگاری کامل با sing-box نسخه 1.8.0
- افزودن قابلیت‌های بیشتر برای بازکردن قفل با WARP، پشتیبانی از geo و domain_keyword، و کنترل کامل
- اضافه کردن قابلیت پرش در پورت hysteria2

# **معرفی**
- اسکریپت نصب یک‌کلیکه Reality Hysteria2 (vmess ws)

## **آموزش استفاده**

### اسکریپت سه‌گانه reality و hysteria2 vmess ws

```bash
bash <(curl -fsSL https://github.com/vveg26/sing-box-reality-hysteria2/raw/main/beta.sh)
```

### اسکریپت دوگانه reality و hysteria2

```bash
bash <(curl -fsSL https://github.com/vveg26/sing-box-reality-hysteria2/raw/main/install.sh)
```

## **ویژگی‌ها**

- نصب یک‌کلیکه بدون نیاز به تنظیمات اضافی یا نصب سفارشی
- بدون نیاز به دامنه، با استفاده از گواهی خودامضا برای استقرار hy2 (با استفاده از تونل Argo پشتیبانی از Vmess WS با IP بهینه (به صورت تئوری سریع‌تر از IP بهینه معمولی))
- امکان تغییر شماره پورت و دامنه Reality، شماره پورت hysteria2
- تولید خودکار لینک‌های سازگار با sing-box، clash-meta، v2rayN، nekoray و غیره
- پشتیبانی از WARP، دروازه ، و SS برای بازکردن قفل استریم‌های رسانه‌ای
- پشتیبانی از انتقال دروازه‌ای
- پشتیبانی از پرش در پورت‌ها

### **ویژگی‌های سفارشی باز کردن قفل WARP**
![](https://img.mareep.net/blog/2023/12/d6fbf369c96dbabb160e67f76dac0d6d.jpg)

## **اعتبارات**
- [sing-box-example](https://github.com/chika0801/sing-box-examples)
- [sing-reality-box](https://github.com/deathline94/sing-REALITY-Box)
- [sing-box](https://github.com/SagerNet/sing-box)

## **بخش آزمایشی**
### tcp-brutal reality (در دسترس در دو نسخه sing-box 1.7.0 و بالاتر)

[مستندات](https://github.com/apernet/tcp-brutal/blob/master/README.zh.md)

```bash
bash <(curl -fsSL https://github.com/vveg26/sing-box-reality-hysteria2/raw/main/tcp-brutal-reality.sh)
```

### brutal reality vision reality hysteria2 سه‌گانه (در دسترس در دو نسخه sing-box 1.7.0 و بالاتر)، طبقه‌بندی WARP، پرش در پورت‌ها و ویژگی‌های دیگر

```bash
bash <(curl -fsSL https://github.com/vveg26/sing-box-reality-hysteria2/raw/main/brutal-reality-hysteria.sh)
```

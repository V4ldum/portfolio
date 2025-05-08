---
title: CTF Android
publishDate: 2021-10-01
summary: Collection of entry-level cybersecurity challenges on Android
lang:  
 - Java
---

### About the project

As part of my engineering curriculum, I built this collection of small security challenges targeting usual code malpractices in mobile application development. Each challenge comes with a vulnerable APK, an introduction to the challenge, and the expected solution. Some of the harder ones also come with hints. I took inspiration from [DIVA](https://github.com/payatu/diva-android), [Insecure Bank](https://github.com/dineshshetty/Android-InsecureBankv2), as well as the [OWASP Top 10 Mobile](https://owasp.org/www-project-mobile-top-10/) for the challenges.

Here is a recap of the malpractices covered
- Hardcoding Issue: A secret was left in the source code of the application.
- Insecure Logging: Sensitive information is being logged by the application.
- Insecure Data Storage: Credentials are being stored in differents data storages in the phone.
- Code Tampering: Local verification bypassed by decompiling, modifying the code and recompiling the applicaiton.
- Input Validation: Arbitrary values are being used by the back-end without sanitization. This one is mostly done through a website, but mobile applications can also be vulnerable since it targets the back-end.
- Vulnerable Activity Components: On Android, an *Activity* is a *thing* a user can do. Some Activities are exported publicly for other applications to invoke them, which can lead to vulnerabilities.
- Flawed RNG: Inproper random numbers generation can lead to deterministic outcome which deserves the purpose.
- Sensitive Information in Memory: A secret is stored in the memory of the application for more time than necessary.

You can find the challenges as well as their source code [here](https://github.com/V4ldum/ctf-android).

### Tech Stack

- **Language:** Java
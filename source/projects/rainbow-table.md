---
title: Rainbow Table
publishDate: 2025-01-01
---

### About the project

This project was built for me to learn how rainbow tables can be used to crack passwords. A *Rainbow Table* is a data structure used to crack password hashes more efficiently than an enumeration, at the cost of exhaustivity, but without having to store a big file containing passwords. The project can generate such a table with custom parameters (charset, length of a chain, number of chains, length of a password) or crack a password hash using an already generated table. I only support the MD5 hashing algorithm for the sake of simplicity, as the project was never meant to be used in the wild. A proper implementation would have to support multiple hashing algorithms.

You can find the source code [here](https://github.com/V4ldum/rainbow-table/).

### Tech Stack

- **Language:** Rust
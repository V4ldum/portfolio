---
title: Proof of Concept Spyware
publishDate: 2025-01-01
---

### About the project

As part of my engineering curriculum, I built a proof of concept for a spyware in Python. The project is split into two parts : a client and a server. 

The server is meant to receive exfiltrated data from the client. The client is able to take screenshots, capture from the microphone as well as the camera, and show an administrator confirmation prompt to steal the password. I also added the possibility for the client to receive arbitrary instructions from the server through the use of *exec*.

At the time of tests, the non-*exec* version of the client was undetectable by antiviruses and the *exec* version was only detected by a few of them. Since is uses *pyscreenshot*, *python-sounddevice* and *opencv-python*, which are legitimate python libraries, it was easy to get through antivirus detection. The *exec* version is however mostly used for attacks which explains why it was detected.

You can find the source code [here](https://github.com/V4ldum/poc-spyware-python).

### Tech Stack

- **Language:** Python
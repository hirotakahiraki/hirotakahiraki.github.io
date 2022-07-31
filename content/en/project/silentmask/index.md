---
title: SilentMask
summary: Mask-type Silent Speech Interface with Measurement of Mouth Movement
tags:
  - Deep Learning
  - Wearable Devices
date: '2021-02-28T00:00:00Z'

# Optional external URL for project (replaces project detail page).
external_link: ''

links:
  - icon: pager
    icon_pack: fa
    name: Paper
    url: https://dl.acm.org/doi/10.1145/3458709.3458985
  
  - icon: youtube
    icon_pack: fab
    name: Demo
    url: https://youtu.be/-DRu5PSCALI


url_code: ''
url_pdf: ''
url_slides: ''
url_video: ''

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
# slides: examples
---

Silent speech interaction is a method of inputting voice commands using only mouth movements without speaking, and is used to assist people with dysphonia.
Lip-reading, myoelectric sensors, and ultrasonic echo devices have been proposed as silent speech interfaces that use the mouth area, but they have the problems of blocking one hand and being conspicuous. 

In this study, we propose SilentMask, a mask-type silent speech interface that recognizes silent speech by measuring the motion around the mouth using acceleration and angular velocity sensors attached to a mask. 

12-dimensional motion information around the mouth was acquired using two acceleration sensors, and analyzed using deep learning. The proposed system was able to discriminate 21 types of speech commands and 22 non-speech states with an accuracy of 79.1%, and to classify 6 types of facial expressions and actions with an accuracy of 84.7%.

<br>
<br>
{{< youtube -DRu5PSCALI >}}
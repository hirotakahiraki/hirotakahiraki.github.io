---
title: SilentMask
summary: 口周辺の運動計測によるマスク型サイレントスピーチインタラクション
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

サイレントスピーチインタラクションは，声を出さずに口の動きだけで音声コマンドを入力する手法であり，発声困難者への支援として用いられている。
従来から口の周辺を利用するサイレントスピーチインタフェースとしてリップリーディング(読唇術)や筋電センサー，超音波エコー装置などを用いた手法が提案されてきたが，片手が塞がってしまうことや目立ちやすいといった課題があった．本研究では，マスクに取り付けた加速度と角速度のセンサを利用し，口周辺の運動を計測することで無声での発話を認識するマスク型のサイレントスピーチインタフェースを提案する．2つの加速度センサを用いて 12 次元の口周辺の運動情報を取得し，深層学習を用いて解析したところ，21 種類の音声コマンドと発話していない状態の計 22状態を79.1%の精度で識別でき，表情と動作の計 6種類に関して分類し 84.7%の精度で認識できた．

<br>
<br>
{{< youtube -DRu5PSCALI >}}
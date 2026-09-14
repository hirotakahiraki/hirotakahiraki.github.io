---
{
  "title": "SilentMask",
  "summary": "Mask-type Silent Speech Interface with Measurement of Mouth Movement",
  "description": "Mask-type Silent Speech Interface with Measurement of Mouth Movement",
  "lang": "en",
  "locale": "en-US",
  "author": "en",
  "permalink": "/project/silentmask/",
  "translation_en": "/project/silentmask/",
  "translation_ja": "/ja/project/silentmask/",
  "image": "/images/projects/silentmask.jpg",
  "links": [
    {
      "icon": "pager",
      "icon_pack": "fa",
      "name": "Paper",
      "url": "https://dl.acm.org/doi/10.1145/3458709.3458985"
    },
    {
      "icon": "youtube",
      "icon_pack": "fab",
      "name": "Demo",
      "url": "https://youtu.be/-DRu5PSCALI"
    }
  ],
  "year": 2021,
  "order": 6,
  "og_image": "projects/silentmask.jpg"
}
---

{% include project-header.html %}

Silent speech interaction is a method of inputting voice commands using only mouth movements without speaking, and is used to assist people with dysphonia.
Lip-reading, myoelectric sensors, and ultrasonic echo devices have been proposed as silent speech interfaces that use the mouth area, but they have the problems of blocking one hand and being conspicuous.

In this study, we propose SilentMask, a mask-type silent speech interface that recognizes silent speech by measuring the motion around the mouth using acceleration and angular velocity sensors attached to a mask.

12-dimensional motion information around the mouth was acquired using two acceleration sensors, and analyzed using deep learning. The proposed system was able to discriminate 21 types of speech commands and 22 non-speech states with an accuracy of 79.1%, and to classify 6 types of facial expressions and actions with an accuracy of 84.7%.



<div class="video-embed"><iframe src="https://www.youtube-nocookie.com/embed/-DRu5PSCALI" title="SilentMask — video demo" loading="lazy" allowfullscreen></iframe></div>

{% include project-back.html %}

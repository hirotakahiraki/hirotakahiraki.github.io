### memo: prepare for deploy academic theme in github action

- 1. get starter-hugo-academic from https://github.com/wowchemy/starter-hugo-academic using "Use this template" button
  ![use this template](./readme0.png)
- 2. create public repository named with {USERNAME}.github.io
- 3. git clone this repository
- 4. setting baseUrl in /config/_default/config.yaml
- 5. open this repository in github and setting Build and deployment github pages from settings/pages/
  ![build and deployment](./readme1.png)
  then, set github action file in .github/workflows/
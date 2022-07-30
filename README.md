### memo: prepare for deploy academic theme in github action

1. get starter-hugo-academic from https://github.com/wowchemy/starter-hugo-academic using "Use this template" button
  ![use this template](./readme0.png)

2. create public repository named with {USERNAME}.github.io
   ![create repository](./readme1.png)
3. git clone this repository

4. setting baseUrl in /config/_default/config.yaml

   ```
   baseURL: 'https://{USERNAME}.github.io/' # Website URL
   ```

5. open this repository in github and setting Build and deployment github pages from settings/pages/
  ![build and deployment](./readme2.png)
  then, set github action file in .github/workflows/
    see this commit: ![9fec3a9](https://github.com/hirotakahiraki/hirotakahiraki.github.io/commit/9fec3a9ecfb640bb3c659882e29019609f302364)
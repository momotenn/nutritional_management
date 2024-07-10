# 栄養情報共有アプリ
　摂取した食事から栄養価を計算、他者に共有するアプリを開発中です。

 ## ワイヤーフレーム

 |ログイン・登録ページ|ユーザーページ|タイムラインページ|投稿ページ|記事詳細ページ|
|--|--|--|--|--|
|![IMG_1739](https://github.com/momotenn/nutritional_management/assets/166217292/4b2e7e7d-49e9-4742-a5dc-5c3b6959edea)|![IMG_1738](https://github.com/momotenn/nutritional_management/assets/166217292/b5e73b8f-e9cb-47bd-9e2d-77fc55ba9360)|![IMG_1737](https://github.com/momotenn/nutritional_management/assets/166217292/30c50871-4fdc-4209-8d2f-d5ddc494c5ce)|![IMG_1736](https://github.com/momotenn/nutritional_management/assets/166217292/93f723d3-8bbf-4f65-8065-e7836c046073)|![IMG_1735](https://github.com/momotenn/nutritional_management/assets/166217292/f99cd21f-31f7-44cd-b8b1-1e14ee27f8c5)|



## アーキテクチャ図
```mermaid
graph TD;

    UI --> Presenter
    Presenter --> Usecase
    Usecase --> Entity
    Usecase --> RepositoryInterface
    RepositoryInterface --> Entity
    Usecase --> GatewayInterface
    Repository --> RepositoryInterface
    Gateway --> GatewayInterface
    Gateway --> Firebase
    Gateway --> ExternalService
    Repository --> Firebase
   
```
### レイヤードアーキテクチャベースで実装

  ## シーケンス図(複雑なもののみ)
### サインインページ
```mermaid
sequenceDiagram;
    UI->>Presentation: サインインページに遷移したことを伝達
    Presentation->>Usecase: サインインUsecaseの実行
    Usecase ->> Gateway: Googleサインインの実行依頼
    Gateway ->> FirebaseAuthentication: Googleサインインの実行依頼
    Gateway -->> Usecase: GoogleUIDの返却
    Usecase->>Repository: サインインしたGoogleUIDに紐ずくユーザーデータがFirebaseにあるか読み取りを依頼
　　　　　　　　Repository->>FireStore: データの検索依頼
　　　　　　　Firestore-->>Repository: 結果返却
    Repository-->>Usecase:結果返却
    Usecase-->> Presentation:結果返却
    alt ユーザーデータがあった場合
    Presentation -->> UI: タイムラインページへの遷移を指示
    else なかった場合
    Presentation -->> UI: 登録ページへの遷移を指示
    end
　　　　　　　　
```

### 登録ページ
  
```mermaid
sequenceDiagram;
　　　　　　UI->>Presentation: 登録情報を伝達
  　　Presentation->>Usecase: 登録情報をFirestoreに保存するようUsecaseに依頼
  　　Usecase->>Repository: 登録情報をFirestoreに保存するよう依頼
Repository->>Firestore: 登録情報を保存依頼
　　　　　　Usecase->>Repository: 登録情報をSharedPreferencesに保存するよう依頼
  　　　　　　　　Repository->>SharedPreferences: 登録情報を保存
   Repository-->>Usecase: データの登録結果を返す
　　　　　　Usecase-->>Presentation: データの登録結果を返す
   Presentation-->>UI: 登録が完了した場合、タイムラインへ遷移<br/>登録に失敗した場合は登録画面へ遷移
　　　　　　 
```

### 栄養価登録ページ
```mermaid
sequenceDiagram;
participant UI
participant Presentation
participant UseCase
participant Gateway
participant Repository

 UI->> Presentation: 登録イベントを通知
 Presentation ->> UseCase:登録UseCaseの実行依頼
UseCase ->> Gateway: 登録内容の英語翻訳を依頼
Gateway ->> GoogleTranslationAPI: 翻訳処理依頼
GoogleTranslationAPI　-->> Gateway: 結果返却
Gateway -->> UseCase: 翻訳したものを返却
UseCase ->> Gateway: EdamamNutritionAPIに栄養価計算を依頼
Gateway ->> EdamamNutritionAPI: 栄養価計算を依頼
EdamamNutritionAPI　-->> Gateway: 結果返却
Gateway ->> UseCase:計算結果の返却
UseCase ->> Repository: 栄養情報の保存を依頼
Repository -->> Firestore:　栄養情報の保存を依頼
```
- 
# 使用技術
- Flutter
- Firebase
  - Authentication
  - Firestore
- SharedPreference
  - ローカルにデータを保存するために使用
- Riverpod
  - Page全体のプレゼンテーションロジックのために使用
- Flutter Hooks
  - Componentに閉じたプレゼンテーションロジックの表現のみに使用
- 外部API
  - [GoogleTranslatorAPI](https://cloud.google.com/translate/?hl=ja)
     - EdamamNutritionAPIが英語しか対応していないので翻訳目的に使う
  - [EdamamNutritionAPI](https://developer.edamam.com/edamam-nutrition-api-demo)
    -　食事内容から栄養価を計算するAPI   

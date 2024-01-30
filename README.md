■サービス概要
どんなサービスなのかを３行で説明してください。

マッチングアプリと映画を掛け合わせた映画好きな人たちのための趣味マッチングアプリ。共通の映画愛を持つユーザー同士が出会い、映画に関する情報や感想を共有できます。

■ このサービスへの思い・作りたい理由 
このサービスの題材となるものに関してのエピソードがあれば詳しく教えてください。 
このサービスを思いつくにあたって元となる思いがあれば詳しく教えてください。

マッチングアプリを利用した経験があり、同じ趣味を持つ素晴らしい人と出会い、楽しい時間を過ごしました。その経験から、趣味に特化したマッチングアプリを作成しようと考えました。そして、私自身が映画を観ることが好きで、映画愛好者同士が映画について話し合える場を提供したいという思いから、映画好きのコミュニティを結びつけるサービスを作ることに決めました。

■ ユーザー層について 
決めたユーザー層についてどうしてその層を対象にしたのかそれぞれ理由を教えてください。

映画好きのユーザー層に焦点を当てることで、共通の趣味を持つ人々が集まり、映画に関する対話や情報共有が活発化するコミュニティを形成することができます。映画は年齢や背景に関係なく楽しめる娯楽であり、幅広い年齢層にアピールします。このため、多様な年齢層のユーザーが参加しやすくなり、多様性を受け入れる場を提供します。

■ サービスの利用イメージ
 ユーザーがこのサービスをどのように利用できて、それによってどんな価値を得られるかを簡単に説明してください。

ユーザーは自分の映画好みに合った他のユーザーを検索し、メッセージを送ることができます。 ユーザーは共通の映画趣味を共有しながら、映画鑑賞や映画に関連したイベントの計画を立てやすい環境を作ることができます。 ユーザーは映画を見終わった後、同じ映画を観たユーザーグループを作成し、感想を交換できます。これにより、映画についてのより深い議論が可能になります。

■ ユーザーの獲得について
 想定したユーザー層に対してそれぞれどのようにサービスを届けるのか現状考えていることがあれば教えてください。
自身のSNSや映画コミュニティでアプリを紹介し、友人やフォロワーに共有をお願いします。
映画好きなオンラインコミュニティでアプリを宣伝し、興味を持つユーザーにアプローチします。
アプリを利用している友人や知人に、アプリを紹介してもらいます。

■ サービスの差別化ポイント・推しポイント
 似たようなサービスが存在する場合、そのサービスとの明確な差別化ポイントとその差別化ポイントのどこが優れているのか教えてください。
 独自性の強いサービスの場合、このサービスの推しとなるポイントを教えてください。

他の一般的なマッチングアプリやコミュニティアプリと異なり、このアプリはユーザーの映画好みを中心にマッチングします。
ユーザーは自分のお気に入りの映画やジャンルを設定し、同じ映画趣味を共有する相手と出会うことができます。
最新の公開予定映画情報や週間の映画ランキングを提供し、ユーザーに新しい映画の発見を支援します。

■ 機能候補
 現状作ろうと思っている機能、案段階の機能をしっかりと固まっていなくても構わないのでMVPリリース時に作っていたいもの、本リリースまでに作っていたいものをそれぞれ分けて教えてください。

MVPリリース:
新規登録機能
マイページ機能
プロフィール詳細
ログインログアウト機能
パスワードリセット機能
メッセージ機能
検索、フィルター機能
いいね機能 相互いいね機能
画像アップロード機能
掲示板投稿機能
通知機能


本リリース:
通話、ビデオ通話機能
ブロック機能
類似度計算のロジックを使用し、好きな映画ジャンル、頻繁に観る映画のタイプなどで類似度が高いユーザーを優先して表示
公開予定映画や週間の映画ランキングを提供

■ 機能の実装方針予定
 一般的なCRUD以外の実装予定の機能についてそれぞれどのようなイメージ(使用するAPIや)で実装する予定なのか現状考えているもので良いので教えて下さい。

メッセージ機能:
アクションケーブルを利用しリアルタイムでチャット機能を実装 JavaScriptでWebSocketを使用

画像アップロード機能:
クラウドストレージサービス: Amazon S3、Google Cloud Storage、Microsoft Azure Blob Storage 画像アップロード用のサービスのAPI: Cloudinary、Imgur API、Firebase Storage

プッシュ通知:
 iOSプッシュ通知: Apple Push Notification Service
 Androidプッシュ通知: Firebase Cloud Messaging、Google Cloud Messaging 
 クロスプラットフォームのプッシュ通知サービス: OneSignal、Pusher、Pusher Beams

通話、ビデオ通話機能:
WebRTC API

公開予定映画や週間の映画ランキング:
The Movie DatabaseやIMDb
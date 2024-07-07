# CC Diary
Capture Your moments, Cultivate Insights


## 競賽議題 & 子議題
- **團隊名稱**： 不嘻嘻的時候，黑客松松澤
- **成員姓名**： 游松澤、張羿軒、劉力瑋、張昀棠
- **競賽議題**： 數位心擁：資訊科技促進心理健康
    - **子議題**： 心靈照護與關懷 X SITCON


### 專案簡介
- 用途/功能：
    CC Diary是一個日記應用程式，旨在幫助用戶記錄每日心情和事件，並提供基於GPT-4 API的心理健康建議。
    功能包括每日日記條目、AI分析反饋、時間軸視覺化、匿名探索頁面、心理健康助手和情緒跟踪圖表。
    - 日記條目和回應：
        撰寫日記條目並收到反饋，強調無縫的體驗和有價值的見解。
    - 時間軸視覺化：
        查看日記時間軸，強調關鍵時刻和趨勢。
    - 匿名探索頁面：
        展示支持性社區，與其他人的匿名互動並獲得反饋。
    - 心理健康助手：
        介紹心理健康助手頁面，包括多語言聊天機器人功能，使用它來獲取常見問題的建議。
    - 情緒跟踪圖表：
        展示情緒跟踪圖表，解釋如何結合 AI 分析和用戶輸入來視覺化情感趨勢。


- 目標客群&使用情境：
  - 學生：<br>
    作為心情記錄和心理健康管理的工具。
  - 一般民眾：<br>
    希望以日記形式記錄生活，並獲得心理健康支持的用戶。
  - 心理健康專業人士：<br>
    可用於輔導患者並追踪其情緒變化。 


- 操作方式：
  - 底部功能列表：
    - 功能列表提供：心理疾病資訊, 探索, 新增日記, 我的日記, 以及統計的功能
  - 新增日記頁面：
    - 頂部有搜尋欄，可讓使用者自行選擇屬於當天心情的音樂。<br>
      中間文字編輯區用於撰寫日記，將於送出後交給AI分析。<br>
      底部拉桿選擇當天心情，右邊送出按鈕按下後，會將以上資訊經過篩選，並交由AI進行分析。<br>
      分析完成後，會跳出結果，內容包含AI做出的看法以及建議等。
  - 心理疾病資訊頁面：
    - 提供各種心理疾病的詳細資訊
  - 心理健康助手頁面：
    - 點擊心理疾病資訊頁面右下的按鈕進入心理健康助手頁面，<br>
      底部輸入關於心理疾病的問題，右下角按鈕送出後，AI會使用我們提供個文件進行統整並回答。
  - 匿名探索頁面：
    - 經過後端篩選通送其他使用者的日記，可在日記中留言
  - 我的日記時間軸頁面：
    - 個人日記的歷史紀錄
  - 情緒跟踪圖表頁面：
    - 每日的心情曲線圖
      

### 使用資源
- 企業資源：
    - OpenAI<br>
    我們所選用的模型。
- 公開資源：
    - LangChain<br>
    有了這個 package，可以更輕鬆的客製化我們的模型。
    - Hugging Face<br>
    提供情緒分析的模型給後端使用。
    - Pytorch<br>
    從使用者的日記客觀地分析其情緒變化並給予回饋。
    - Flutter<br>
    用於構建 APP
- 後端程式：
  - https://github.com/Andrewtangtang/CCdiary-backend<br>
    提供API給APP使用。
    

### 你還想分享的事情
  - 推廣全球為目標！<br>
    使用Flutter框架，有助於建立更好的程式架構，易於多人開發<br>
    實作 l10n，目前支援中文和英文，方便全世界的人使用

### 成果展示
- 可附上其他專案介紹的投影片/文件等等
> SITCON Hackathon 2024

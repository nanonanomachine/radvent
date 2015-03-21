radvent
=======

<a href="http://i.imgur.com/oRqAeo5.png"><img src="http://i.imgur.com/oRqAeo5.png"  width="300px" ></a>
<a href="http://i.imgur.com/aq5fCL5.png"><img src="http://i.imgur.com/aq5fCL5.png"  width="300px" ></a>

Advent calendar app for programmers like Qiita. An entry is written by markdown. 

日本語
-------

QiitaライクなAdventCalendarアプリです。Markdownを用い記事を登録します。記事は事前に登録し、該当日がすぎると自動的に公開されます。

radventはMarkdownパーサーとして[chjj/marked](https://github.com/chjj/marked)を、シンタックスハイライトに[isagalaev/highlight.js](https://github.com/isagalaev/highlight.js)を用いています。

###設定


`config/initializer/constants.rb`を編集することにより、AdventCalendarの開始日時を変更することができます。

```ruby:constants.rb
module Constants
    # Set advent calendar date
    YEAR = 2015
    MONTH = 12
    START_DAY = 1
    END_DAY = 25
end
```

また日本語と英語のロケールがサポートされています。
`config/application.rb`で希望のロケールに設定してください。

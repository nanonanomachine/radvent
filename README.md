radvent
=======

<a href="http://i.imgur.com/oRqAeo5.png"><img src="http://i.imgur.com/oRqAeo5.png"  width="300px" ></a>
<a href="http://i.imgur.com/aq5fCL5.png"><img src="http://i.imgur.com/aq5fCL5.png"  width="300px" ></a>

Advent calendar app for programmers like Qiita. 

* Creating an entry & automatically published when the day has come.
* Markdown Editor(using [chjj/marked](https://github.com/chjj/marked))
* Syntax highlighting support(using [isagalaev/highlight.js](https://github.com/isagalaev/highlight.js))
* Image upload

###Setting

Advent calendar date can be changed. Edit constants in `config/initializer/constants.rb`

```ruby:constants.rb
module Constants
    # Set advent calendar date
    YEAR = 2015
    MONTH = 12
    START_DAY = 1
    END_DAY = 25
end
```

Japanese and English locale are supported. Set the desired locale in `config/application.rb`.

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

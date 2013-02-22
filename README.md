xFrame
======

A common web app frame on rails.

关系数据库连接
=======
1. 将必要的gem包声明写入Gemfile文件；
2. 在config/database.yml 文件中配置数据库连接适配器

Gem包
------
[ActiveRecord](https://github.com/rails/rails/tree/master/activerecord)
是Rails的 ORMapping 框架，以下简称AR。

AR 在JRuby环境下连接数据库需要
[activerecord-jdbc-adapter](https://github.com/jruby/activerecord-jdbc-adapter)
gem包的支持，该gem包还提供了多个适配器（Adapter）分别用于支持：

* MySQL：[activerecord-jdbcmysql-adapter](http://rubygems.org/gems/activerecord-jdbcmysql-adapter)
* PostgreSQL: [activerecord-jdbcpostgresql-adapter](http://rubygems.org/gems/activerecord-jdbcpostgresql-adapter)
* SQLite3: [activerecord-jdbcsqlite3-adapter](http://rubygems.org/gems/activerecord-jdbcsqlite3-adapter)
* Derby: [activerecord-jdbcderby-adapter](http://rubygems.org/gems/activerecord-jdbcderby-adapter)
* HSQLDB: [activerecord-jdbchsqldb-adapter](http://rubygems.org/gems/activerecord-jdbchsqldb-adapter)
* H2: [activerecord-jdbch2-adapter](http://rubygems.org/gems/activerecord-jdbch2-adapter)
* MSSQL: [activerecord-jdbcmssql-adapter](http://rubygems.org/gems/activerecord-jdbcmssql-adapter)

然而，Oracle数据库还需要另外一个gem包括的支持：[activerecord-oracle_enhanced-adapter](https://github.com/rsim/oracle-enhanced)

配置
------
修改 database.yml 文件，添加以下内容：

For MySQL database

    adapter: jdbcmysql
    host: localhost
    database: db-name
    username: u-name
    password: passwd

For Oracle database

    adapter: oracle_enhanced
    host: localhost
    database: sid
    username: u-name
    password: passwd

- - - - - - - - - - - - - - - - - - - - - -

模块化支持
=========
Rails使用Engine来实现模块化，参考[Rails Engine 指南](http://guides.ruby-china.org/engines.html)了解更多信息。

首先使用命令：`rails plugin new mymodule --full --mountable` 创建一个mymodule模块，它是一个标准的Gem包。


Rails的Engine涉及两个概念，

* Engine，一个微型程序，提供相对独立的特定功能，它和一个普通Rails应用非常相似，拥有基本一致的结构。

* 宿主程序，一个包含Engine的 普通rails应用。

在宿主程序中引入一个模块有两个步骤：

1. 添加gem包申明在Gemfile文件中， `gem 'mymodule', path: '../mymodule'`
2. 添加路由信息到routes.rb文件， `mount MyModule::Engine => "/mymodule"`

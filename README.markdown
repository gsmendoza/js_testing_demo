README
======

This is demonstrate how I used

* [Jasmine] to write JavaScript unit tests,
* [Capybara] to write integration tests for my JavaScript code, and
* [jasmine-query] to load dom fixtures,
* [fixture generation methods.rb] to generate the dom fixtures whenever the controller specs are ran

The app displays a dummy player widget that can play/pause dummy songs from its dummy playlist. No, it doesn't really _play_ songs. Yes, the app is a bit of a dummy.

Installation
------------------------

* `git clone git@github.com:gsmendoza/js_testing_demo.git`
* set up your database.yml
* `rake db:setup`
* `./script/server`

Testing
-------

* `rake spec`
* `rake jasmine`
* `rake cucumber`

*Note*: Run `rake spec` first before jasmine so that the controller specs will generate the dom fixtures for the JavaScript tests.

TODO
----

  Figure out why rake jasmine:ci is not working as expected.

  [Jasmine]: https://jasmine.github.io/
  [Capybara]: http://github.com/jnicklas/capybara
  [jasmine-query]: http://github.com/velesin/jasmine-jquery
  [fixture generation methods.rb]: http://pivotallabs.com/users/jb/blog/articles/1152-javascripttests-bind-reality-

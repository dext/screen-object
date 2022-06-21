# screen-object

screen-object is a ruby gem. It is a wrapper on top of Appium. 
This gem helps create screen objects for automating ios and android mobile apps. 
screen-object methods interact with the elements on the screen.

### Gem Dependencies

Other gems used by screen-object:
- rake 
- require_all 
- rspec 
- appium_lib 
- page_navigation 
- childprocess

### Setup Instructions

Add the gem to gemfile
  
```shell
gem 'screen-object'
```

Add the gem to supporting file

```
require 'screen-object'
```
 
Include screen-object module to the class

```
include ScreenObject
```

After including this screen-object module, numerous methods will be added in to your class that allow you to define your screen.
For the login page you might design your test in following way:

Calling the `text_field` and `button` methods. To login, we could simply write the following code:

```ruby
class LoginScreen
  include ScreenObject
  # This will add several methods to our page object that allow us to interact with the items on the screen.

  text_field :username, name: 'username'
  text_field :password, name: 'password'
  button :login, name: 'login'

  def enter_username(username)
    self.username = username
  end

  def enter_password(password)
    self.password = password
  end

  def click_login_button
    login
  end
end
```

Now, you can call those methods into actual spec file:

```rspec
describe 'Client' do
    it 'logs into their account' do
      on(LoginScreen).enter_username('test_user')
      on(LoginScreen).enter_password('secret')
      on(LoginScreen).click_login_button
    end
end
```

## License

See [LICENSE](LICENSE) for details.
 


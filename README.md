## Github search
Clone this repo and the run it by doing  
    
    ./app.rb
    
And navigate to `http://localhost:4567/`  
Also run tests by running
    
    rake test
    
- Find `log` folder at root. Logs are saved separataly for `Sinatra`, `app` and also based on environment.
- Modify [settings](config/settings.yml) to add / delete messages or `JSON` keys (that you want to display on front end)
- TODO: Async mode. Now it should wait for Github to respond. Making it Async would create smoother user exprience.

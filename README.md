# Funny Movies

## Environments
* Macbook with M1 pro chip
* MacOS Ventura 13.2
* Ruby 3.0.4 installed

## How to deploy this app
Clone this repository
```
git clone https://github.com/vinhdoanthe/funny-movies.git
```

Go to the project directory, and install dependencies
```
cd funny-movies
bundle install
```

Migrate database
```
rails db:migrate
```

Add environment varialbes in .env file
```
cp env.example .env
```
To get a Youtube API key, follow [the instructions here](https://developers.google.com/youtube/registering_an_application). After generating a Youtube API key it is necessary to enable the YouTube Data API for the project which your API key was generated [enable Youtube Data API here](https://console.developers.google.com/apis/library/youtube.googleapis.com).

Run the project
```
bin/dev
```

To run tests, try
```
rails test
```

## Things could be improved
- Improve the solution checking whether user voted for a movie 
- Use ActiveJob with Sidekiq to handle the movie sharing job 
- Use Redis to cache the data of the most frequent requested movies

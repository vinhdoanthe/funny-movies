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
Run the project
```
bin/dev
```

## Something could be improved
- Improve the solution checking whether user voted for a movie 
- Use ActiveJob with Sidekiq to handle the movie sharing job 
- Use Redis to cache the data of the most frequent requested projects

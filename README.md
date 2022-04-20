# mfsched

This simple app automates meeting schedules between mentors and fellows.

- [Live Demo](#)
- [Source Data](https://drive.google.com/file/d/1YcA1rmWdeyRTfX5yyQDc6EPzmOo8NPNe/view?usp=sharing)
- [Project Requirements](https://drive.google.com/file/d/1HKPelu_trblEUKA0_eh1lTRxc6ZYjvAF/view?usp=sharing)

## Stack
- Rails 7 (importmaps)
- Postgresql
- Tailwind
- Rspec

## Installation
- Clone repo
- bundle install
- rails db:create db:migrate

## Development Environment
- Foreman
- Standardrb

## How it Works

This app generates and displays non-conflicting program schedules that match mentors and fellows for 20-minute meetings held during AM/PM blocks during the program days.

To use the app, visit the app's main URL and upload the provided [csv file](https://drive.google.com/file/d/1YcA1rmWdeyRTfX5yyQDc6EPzmOo8NPNe/view?usp=sharing). The app will parse the file and schedule meeting slots between mentors and fellows.

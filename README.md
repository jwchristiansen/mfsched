# mfsched

Automated scheduling for mentor<>fellow 1:1s from CSV file.

[Live Demo](https://mfsched.herokuapp.com/)

## Use
(1) Upload CSV file:
<div><img src="https://s3.us-west-2.amazonaws.com/joelc.io/form.png" alt="form" width="250"/></div>

(2) Presto, a schedule:
<div><img src="https://s3.us-west-2.amazonaws.com/joelc.io/schedule.png" alt="form" width="500"/></div>
 
## Specs
- [Project Requirements](https://drive.google.com/file/d/1HKPelu_trblEUKA0_eh1lTRxc6ZYjvAF/view?usp=sharing)
- [Source Data](https://drive.google.com/file/d/1YcA1rmWdeyRTfX5yyQDc6EPzmOo8NPNe/view?usp=sharing)

## Stack
- Rails 7.0.2.3 (importmaps)
- Ruby 3.0.1
- Stimulus
- Postgresql
- Tailwind
- Rspec (_placeholder setup only_)

## Installation

(1) Clone

`git clone https://github.com/jwchristiansen/mfsched.git`

(2) Directory

`cd mfsched`

(3) Bundle

`bundle install`

(4) Database

`rails db:create db:migrate`

## Server

Install [Foreman](https://github.com/ddollar/foreman) with `gem install foreman` (don't add this in your Gemfile)

Start server with: `foreman start -f Procfile.dev`
  - __Note:__ This bash/zsh alias reduces the above command to two keystrokes 😎: 
    - `alias fm="foreman start -f Procfile.dev"`

## Style Guide

This application uses [Standard](https://github.com/testdouble/standard) for style, linting, and formatting.

Run and fix with `standardrb` and `standardrb --fix` respectively.

## How It Works

This app generates and displays non-conflicting program schedules that match mentors and fellows for 20-minute meetings held during AM/PM blocks during the program days.

The form rendered at `app/views/programs/index.html.slim` submits a POST requst to `programs#create`. This triggers two primary methods:

`import_csv` ([`app/models/program.rb`](https://github.com/jwchristiansen/mfsched/blob/main/app/models/program.rb))

  - Iterates through the CSV and populates mentors, fellows, and unscheduled meetings into the database.

`schedule_slot` ([`app/models/meeting.rb`](https://github.com/jwchristiansen/mfsched/blob/main/app/models/meeting.rb))

  - Iterates through meetings and schedules them at free times.

## TODO

Lots.

- Form validation
- Query performance
- Unit and integration tests
- Refactor `app/models/meeting.rb`
- Fix `ActionController::RoutingError (No route matches [DELETE] "/"):` when deleting program
- Design

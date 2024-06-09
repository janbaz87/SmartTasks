# SmartTasks

A task management app for employees to manage their daily tasks.


## Introduction

This app allows employees to manage their daily tasks, ensuring they know what is expected of them and can report their progress or any issues.


## Technical Approach

This app uses the VIPER architecture and modular approach for networking, and it is built with a focus on clean code and SOLID principles.


## 3 User Stories Implemented 

### 1. See Today's Tasks

**As a user I want to see my tasks for today so I know what is expected from me to be accomplished**

#### Context

Employees have defined tasks for each day. They need to see a list of these tasks in the application to understand what needs to be resolved.

#### Scenario

- User opens the app.
- User sees a list of tasks for today.
- Title of tasks should always be visible.

#### Notes

All tasks can be found on this endpoint: http://demo1414406.mockable.io/

### 2. See Tasks for Other Days

**As a user I can see my tasks for other days from tomorrow so that I can prepare on that is upcoming or review my past working days**

#### Context

Employees can see a list of tasks for any day that is not today.

#### Scenario

- User opens the app.
- User sees a list of tasks for today.
- User taps on arrow to view tasks of the next day or previous day.
- User sees in the title for which date they are looking.

### 3. Order Tasks by Priority

**As a user I want my tasks to be ordered by priority so I know which one to tackle first**

#### Context

While all tasks are important, employees may not be able to resolve all tasks. They need to know which tasks to tackle first.

#### Scenario

- User opens the app.
- User sees tasks for today.
- User sees tasks ordered by priority.
- The first task has the highest priority.


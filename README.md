# 📝 To-Do App with User Authentication
A simple and responsive To-Do List Web Application built with Ruby on Rails, styled with Bootstrap, and featuring user registration & login via Devise. Each user can manage their own tasks with filters for completion status and creation date.

## 📸 Features
✅ User Registration & Login (Devise)

🔐 Session management (Logout, flash messages)

🗃️ Task CRUD (Create, Read, Update, Delete)

🗓️ Filter by:

- Task completion (All, Completed, Pending)

- Year and Month of creation

🧑 Tasks are scoped per user

🎨 Clean UI using Bootstrap 5

## 💻 Tech Stack
- Ruby on Rails 7+

- PostgreSQL (Database)

- Devise (Authentication)

- Bootstrap 5 (Styling)

- Turbo / Hotwire (Navigation)

## 🚀 Getting Started
1. Clone the Repo by using the following:

       git clone https://github.com/anoosha-sanugula/todo_app.git

2. Go to the project directory:

       cd todo_app_demo

2. Install Dependencies

       bundle install
3. Database Setup

       rails db:create
       rails db:migrate

4. Run the Server

       rails server


## 🔑 Default Routes

- /users/sign_up ==> User Registration
- /users/sign_in ==> User Login
- /tasks ==> Task Dashboard (after login)

## 🧪 Sample Features

- Create Task: Add new task from "New Task" button.

- Edit/Delete: Available per task.

- Filter: Use status buttons and date dropdowns.

- Auth Guard: Only signed-in users can access /tasks.

## 🛡️ Devise Configuration
Devise handles:

- User sign up / login / logout

- Password encryption & validation

- Session persistence


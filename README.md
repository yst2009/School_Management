# 🏫 School Management ERP

**Complete school system with Zoom integration, GPA calculation & multi-branch support**

## 🎯 Core Features

✅ Student Management (Profiles - Grades - GPA)
✅ Teacher & Staff Management
✅ Attendance Tracking (Daily/Monthly)
✅ Exam Results & Report Cards
✅ Zoom Meeting Integration
✅ Parent Portal Access
✅ Multi-Branch School Support
✅ PDF Reports Generation
✅ Class Schedules & Timetables

text

## 🛠️ Tech Stack
Backend: Laravel 10 - PHP 8.2
Admin: FilamentPHP v3 - Livewire
Database: MySQL - Eloquent
Integrations: Zoom API - SMS
Frontend: Blade - Alpine.js

text

## 📊 Key Modules

📚 Students → Classes → Grades → Reports
👨‍🏫 Teachers → Subjects → Schedules
📅 Attendance → Exams → Results
🏛️ Branches → Classes → Students
📱 Parents → Student Portal

text

## 🚀 Quick Setup (5 Minutes)

```bash
git clone https://github.com/yst2009/School_Management.git
cd School_Management
composer install
npm install
cp .env.example .env
php artisan key:generate
php artisan migrate --seed
npm run build
php artisan serve


# Backend Features for Fan Wiki SPA

## Languages

PHP + Mysql + Apache (MAMP)

## 1. Authentication

- Login/logout for admins
- Session-based authentication (PHP sessions)
- Optional: JWT for API token access if needed

## 2. Database

- MySQL (or SQLite for local development)
- Tables:
  - `users` → admin accounts
  - `pages` → wiki articles
  - `images` → uploaded images for pages
  - Optional: `logs` → moderation or activity logs

## 3. APIs (PHP)

- REST endpoints:
  - `GET /api/pages.php` → fetch all wiki pages
  - `POST /api/pages.php` → create a new page
  - `PUT /api/pages.php?id=123` → update a page
  - `DELETE /api/pages.php?id=123` → delete a page
- Admin interface calls APIs using `fetch` or `axios` from React SPA

## 4. Admin Interface (React SPA)

- CRUD operations:
  - Create, read, update, delete pages
  - Upload images for pages
  - Manage users/admin accounts
- SPA communicates only with backend APIs

## 5. Optional Extra Features

- File uploads (images), handled by PHP  
- Moderation/activity logs stored in database  
- Caching with Redis (optional, advanced)

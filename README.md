# 🚀 MongoDB Atlas Rails API (Test Project) 🔧

## 📝 Description
A simple REST API built with Ruby 3.3.3 and Rails 8 for user management, connected to MongoDB Atlas ☁️

## 🛠️ Features
- ✅ Full CRUD operations for Users
- 🔢 Pagination with `page` and `limit` parameters
- 🔍 Basic filtering capabilities
- ⏱️ Automatic timestamp management
- 📊 MongoDB Atlas integration
- 📦 JSON API responses with metadata

## 🚀 Getting Started

### Prerequisites
- Ruby 3.3.3
- Rails 8.0.2
- MongoDB Atlas account

### Installation
1. Install dependencies:
```bash
bundle install
```

2. Set up environment variables:
```bash
cp env.example .env
```

3. Start the server:
```bash
rails s
```

## 🌐 API Documentation

### Endpoints
#### GET `/api/v1/users`
List all users with pagination

**Parameters**:
- `page` (optional) - Page number (default: 1)
- `limit` (optional) - Items per page (default: 20)

**Example Request**:
```http
GET /api/v1/users?page=2&limit=2
```

**Success Response**:
```json
[
  {
    "_id": "59b99db5cfa9a34dcd7885b8",
    "name": "Jaime Lannister",
    "email": "nikolaj_coster-waldau@gameofthron.es"
  },
  {
    "_id": "59b99db5cfa9a34dcd7885b9",
    "name": "Catelyn Stark",
    "email": "michelle_fairley@gameofthron.es"
  }
]
```

## 🔄 Data Migration
To add timestamps to existing records:
```bash
rake data_migration:add_timestamps_to_users
```

## 🛠️ Technical Details
- **Database**: MongoDB Atlas (Free Tier)
- **ORM**: Mongoid
- **Pagination**: mongoid-pagination
- **Serialization**: ActiveModel Serializers

## ⚠️ Important Notes
- 🧪 This is a test project only
- 🔒 Never commit sensitive data (.env files)
- ⏰ All timestamps are in UTC
- 📊 Requires internet connection for MongoDB Atlas

## 📜 License
This project is licensed under the MIT License.

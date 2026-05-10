# CardNest

CardNest is a full-stack mobile product featuring a Flutter frontend app (supporting both user and business roles) and a FastAPI backend powered by PostgreSQL and Redis.

## Project Structure

- `mobile/`: Flutter mobile app utilizing Riverpod, GoRouter, Dio, and freezed. Organized by clean architecture modules.
- `backend/`: FastAPI backend organized by domain. Uses PostgreSQL for the primary database and Redis for caching/jobs.

## Local Setup Using Docker

To start the local development environment for the backend services:

1. Ensure Docker and Docker Compose are installed.
2. Duplicate `.env.example` to `.env` in the root (or `backend/` directory) and adjust if needed:
   ```bash
   cp backend/.env.example backend/.env
   ```
3. Run the following command from the root directory to build and start the API, Postgres, and Redis containers:
   ```bash
   docker-compose up -d --build
   ```

The FastAPI application will be available at `http://localhost:8000`. You can access the auto-generated Swagger UI documentation at `http://localhost:8000/docs`.

To stop the services:
```bash
docker-compose down
```

## Mobile App Setup

1. Change directory to the mobile app:
   ```bash
   cd mobile
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Generate required freezed/json_serializable files:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. Run the app:
   ```bash
   flutter run
   ```

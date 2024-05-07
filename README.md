# Just a blog app using bun and NextJS 14


## Prerequisites

Before you begin, ensure you have met the following requirements:

* You have installed Docker.
* You have installed Node.js and npm OR bun [ I made this using bun].

## Setting Up and Running the Application

Follow these steps to get your application up and running:

### Step 1: Setup the Database

1. Start your Docker containers:

```bash
docker compose up -d

```

2. Import the database dump:

```bash
cat ./dump_2024-05-08_01_35_11.sql | docker exec -i <your container name> psql -U postgres
```
If you want to start with a fresh database 

```bash
npx prisma migrate dev
```

### Step 2: Setup the Enviroment

Copy the example.env file to .env or set up your own environment variables.

```bash
cp example.env .env
```

### Step 3: Run the application

```bash
npm run dev
```


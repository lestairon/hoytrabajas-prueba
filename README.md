# HoyTrabajas prueba tecnica

Prueba tecnica para HoyTrabajas

## Installation

### Without Docker

1. **Clone the repository**

   ```bash
   git clone git@github.com:lestairon/hoytrabajas-prueba.git
   cd hoytrabajas
   ```

2. **Install dependencies**

   ```bash
   bundle install
   ```

3. **Setup the database**

   ```bash
   rails db:create
   rails db:migrate
   ```

### With Docker

1. **Clone the repository**

   ```bash
   git clone git@github.com:lestairon/hoytrabajas-prueba.git
   cd hoytrabajas
   ```

2. **Build the Docker image**

   ```bash
   docker build -t myapp .
   ```

3. **Run the Docker container**

   ```bash
   docker-compose up
   ```

## Starting/Deploying the Project

### In Development Environment

- **Without Docker**

  ```bash
  rails server
  ```

- **With Docker**

  ```bash
  docker-compose up
  ```

### In Production Environment

- Ensure that all production environment variables are set.
- Precompile the assets:

  ```bash
  RAILS_ENV=production rails assets:precompile
  ```

- Start the server in production mode:

  ```bash
  RAILS_ENV=production rails server
  ```

## Routes

The project has the following routes:

- **Devise Default URLs**: Used for authentication.

  - `/users/sign_in`
  - `/users/sign_up`
  - `/users/sign_out`
  - etc.

- **Banks**: CRUD operations for banks.

  - `GET /banks` - Index of banks
  - `GET /banks/:id` - Show a specific bank
  - `GET /banks/new` - Form to create a new bank
  - `POST /banks` - Create a bank
  - `GET /banks/:id/edit` - Edit a specific bank
  - `PATCH/PUT /banks/:id` - Update a specific bank
  - `DELETE /banks/:id` - Delete a specific bank

- **Providers**: CRUD operations for providers.

  - `GET /providers` - Index of providers
  - `GET /providers/:id` - Show a specific provider
  - `GET /providers/new` - Form to create a new provider
  - `POST /providers` - Create a provider
  - `GET /providers/:id/edit` - Edit a specific provider
  - `PATCH/PUT /providers/:id` - Update a specific provider
  - `DELETE /providers/:id` - Delete a specific provider

- **Dashboard**
  - `GET /dashboard` - Main dashboard page.

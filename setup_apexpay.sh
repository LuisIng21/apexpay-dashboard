#!/bin/bash

# setup_apexpay.sh - Script de inicialización ApexPay Dashboard
# Este script crea la estructura base del proyecto ApexPay Fintech

echo "=== Iniciando ApexPay Dashboard Setup ==="

# Crear estructura de carpetas
mkdir -p src/components
mkdir -p src/pages
mkdir -p src/styles
mkdir -p src/services
mkdir -p public/images
mkdir -p config
mkdir -p tests
mkdir -p logs

# Crear archivos de configuración
cat > .env.example << 'EOF'
# ApexPay API Keys (Example)
STRIPE_SECRET_KEY=sk_live_example
STRIPE_PUBLISHABLE_KEY=pk_live_example
API_BASE_URL=https://api.apexpay.local
DB_HOST=localhost
DB_PORT=5432
DB_NAME=apexpay_dev
EOF

# Crear archivo de dependencias simuladas
cat > package.json << 'EOF'
{
  "name": "apexpay-dashboard",
  "version": "1.0.0",
  "description": "ApexPay Financial Dashboard",
  "main": "index.js",
  "scripts": {
    "start": "node src/index.js",
    "dev": "nodemon src/index.js",
    "test": "jest"
  },
  "keywords": ["fintech", "dashboard", "payments"],
  "author": "ApexPay Team",
  "license": "MIT",
  "dependencies": {
    "express": "^4.18.0",
    "axios": "^1.3.0",
    "dotenv": "^16.0.3"
  }
}
EOF

# Crear archivo principal de aplicación
cat > src/index.js << 'EOF'
// ApexPay Dashboard - Main Entry Point
const express = require('express');
const app = express();

console.log('ApexPay Dashboard initialized');

module.exports = app;
EOF

# Crear componente ejemplo
cat > src/components/Dashboard.js << 'EOF'
// ApexPay Dashboard Component
export const Dashboard = {
  name: 'Dashboard',
  version: '1.0.0',
  description: 'Main dashboard view for ApexPay'
};
EOF

# Crear página de prueba
cat > src/pages/transactions.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
  <title>ApexPay - Transactions</title>
</head>
<body>
  <h1>ApexPay Transactions</h1>
  <p>Transaction history will be displayed here</p>
</body>
</html>
EOF

# Crear archivo de estilo
cat > src/styles/main.css << 'EOF'
/* ApexPay Dashboard Styles */
body {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
}

.dashboard {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}
EOF

# Crear archivo de servicio
cat > src/services/api.js << 'EOF'
// ApexPay API Service
export const apiService = {
  baseURL: process.env.API_BASE_URL || 'http://localhost:3000',
  
  async fetchTransactions() {
    // Mock implementation
    return [];
  },
  
  async fetchBalance() {
    // Mock implementation
    return 0;
  }
};
EOF

# Crear archivo de configuración
cat > config/app.config.js << 'EOF'
// ApexPay Configuration
module.exports = {
  appName: 'ApexPay Dashboard',
  version: '1.0.0',
  port: process.env.PORT || 3000,
  environment: process.env.NODE_ENV || 'development'
};
EOF

# Crear carpeta de logs
touch logs/.gitkeep

# Crear archivo de ejemplo en node_modules (será ignorado por .gitignore)
mkdir -p node_modules/example
echo "This is a mock dependency" > node_modules/example/index.js

# Crear archivo de prueba
cat > tests/dashboard.test.js << 'EOF'
// ApexPay Dashboard Tests
describe('Dashboard', () => {
  it('should load successfully', () => {
    expect(true).toBe(true);
  });
});
EOF

echo "=== ApexPay Dashboard Setup Completed ==="
echo "Estructura de proyecto creada exitosamente"

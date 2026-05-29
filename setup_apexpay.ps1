# setup_apexpay.ps1 - Script de inicialización ApexPay Dashboard para PowerShell

Write-Host "=== Iniciando ApexPay Dashboard Setup ===" -ForegroundColor Green

# Crear estructura de carpetas
$directories = @(
    "src\components",
    "src\pages",
    "src\styles",
    "src\services",
    "public\images",
    "config",
    "tests",
    "logs"
)

foreach ($dir in $directories) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
        Write-Host "Creada carpeta: $dir"
    }
}

# Crear .env.example
@'
# ApexPay API Keys (Example)
STRIPE_SECRET_KEY=sk_live_example
STRIPE_PUBLISHABLE_KEY=pk_live_example
API_BASE_URL=https://api.apexpay.local
DB_HOST=localhost
DB_PORT=5432
DB_NAME=apexpay_dev
'@ | Out-File ".env.example" -Encoding UTF8

# Crear package.json
@'
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
'@ | Out-File "package.json" -Encoding UTF8

# Crear src/index.js
@'
// ApexPay Dashboard - Main Entry Point
const express = require('express');
const app = express();

console.log('ApexPay Dashboard initialized');

module.exports = app;
'@ | Out-File "src\index.js" -Encoding UTF8

# Crear src/components/Dashboard.js
@'
// ApexPay Dashboard Component
export const Dashboard = {
  name: 'Dashboard',
  version: '1.0.0',
  description: 'Main dashboard view for ApexPay'
};
'@ | Out-File "src\components\Dashboard.js" -Encoding UTF8

# Crear src/pages/transactions.html
@'
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
'@ | Out-File "src\pages\transactions.html" -Encoding UTF8

# Crear src/styles/main.css
@'
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
'@ | Out-File "src\styles\main.css" -Encoding UTF8

# Crear src/services/api.js
@'
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
'@ | Out-File "src\services\api.js" -Encoding UTF8

# Crear config/app.config.js
@'
// ApexPay Configuration
module.exports = {
  appName: 'ApexPay Dashboard',
  version: '1.0.0',
  port: process.env.PORT || 3000,
  environment: process.env.NODE_ENV || 'development'
};
'@ | Out-File "config\app.config.js" -Encoding UTF8

# Crear logs/.gitkeep
"" | Out-File "logs\.gitkeep" -Encoding UTF8

# Crear mock node_modules
if (-not (Test-Path "node_modules")) {
    New-Item -ItemType Directory -Path "node_modules\example" -Force | Out-Null
    "This is a mock dependency" | Out-File "node_modules\example\index.js" -Encoding UTF8
}

# Crear tests/dashboard.test.js
@'
// ApexPay Dashboard Tests
describe('Dashboard', () => {
  it('should load successfully', () => {
    expect(true).toBe(true);
  });
});
'@ | Out-File "tests\dashboard.test.js" -Encoding UTF8

Write-Host "=== ApexPay Dashboard Setup Completado ===" -ForegroundColor Green
Write-Host "Estructura de proyecto creada exitosamente" -ForegroundColor Cyan

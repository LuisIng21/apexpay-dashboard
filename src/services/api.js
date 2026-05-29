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

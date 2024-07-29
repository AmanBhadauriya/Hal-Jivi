module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545, // Or the port number displayed in Ganache
      network_id: "*" // Match any network id
    }
  },
  compilers: {
    solc: {
      version: "0.8.1", // Ensure it matches the Solidity compiler version you're using
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        }
      }
    }
  }
};

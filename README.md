# Tokenized Bonds on Aptos

## Overview
This repository implements a **Tokenized Bonds** module on the Aptos blockchain using Move. The smart contract enables bond issuers to create digital bonds and allows investors to purchase them securely.

## Features
- **Bond Issuance**: Issuers can create bonds with a face value, maturity date, and interest rate.
- **Bond Purchase**: Investors can buy bonds using AptosCoin.
- **Secure Transactions**: Uses Move's resource-oriented programming model to ensure safe handling of bond assets.

## Move Module Structure

### **Bond Struct**
```move
struct Bond has store, key {
    total_issued: u64,       // Total bonds issued
    face_value: u64,         // Value of each bond
    maturity_date: u64,      // Maturity timestamp
    interest_rate: u64,      // Annual interest rate (in basis points)
    issuer: address,         // Address of the bond issuer
}
```

### **Functions**
- `create_bond`: Allows an issuer to create a new bond.
- `purchase_bond`: Enables investors to buy bonds by transferring funds to the issuer.

## Setup & Deployment

### **Prerequisites**
- Install the Aptos CLI
- Setup an Aptos testnet or devnet account

### **Deploying the Module**
1. Clone this repository:
   ```sh
   git clone https://github.com/your-username/tokenized-bonds.git
   cd tokenized-bonds
   ```
2. Compile the Move module:
   ```sh
   aptos move compile --named-addresses MyModule=default
   ```
3. Publish the module to the Aptos blockchain:
   ```sh
   aptos move publish --named-addresses MyModule=default
   ```

## Usage

### **Create a Bond**
Call the `create_bond` function with issuer details:
```move
create_bond(&issuer, total_bonds, face_value, maturity_date, interest_rate);
```

### **Purchase a Bond**
Investors can call the `purchase_bond` function:
```move
purchase_bond(&investor, issuer_address, amount);
```
### **contract address**
0xf18ae68310e6c51225148c543f9144ee8d5df3692018435e07a09f328679430a

![Screenshot_2025-03-26_11_22_53](https://github.com/user-attachments/assets/f7840998-0dab-4068-9915-569c1f97fded)

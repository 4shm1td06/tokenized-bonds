module MyModule::TokenizedBonds {
    use std::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a bond
    struct Bond has store, key {
        total_issued: u64,       // Total bonds issued
        face_value: u64,         // Value of each bond
        maturity_date: u64,      // Maturity timestamp
        interest_rate: u64,      // Annual interest rate (in basis points)
        issuer: address,         // Address of the bond issuer
    }

    /// Function to create a new bond offering
    public fun create_bond(
        issuer: &signer, 
        total_bonds: u64, 
        face_value: u64, 
        maturity_date: u64, 
        interest_rate: u64
    ) {
        let bond = Bond {
            total_issued: 0,
            face_value,
            maturity_date,
            interest_rate,
            issuer: signer::address_of(issuer)
        };

        // Move the bond struct to the issuer's account
        move_to(issuer, bond);
    }

    /// Function for investors to purchase bonds
    public fun purchase_bond(
        investor: &signer, 
        issuer: address, 
        amount: u64
    ) acquires Bond {
        // Borrow the bond resource
        let bond = borrow_global_mut<Bond>(issuer);

        // Ensure we're not exceeding total bond issuance
        assert!(bond.total_issued + amount <= bond.total_issued, 0);

        // Transfer funds from investor to issuer
        let payment = coin::withdraw<AptosCoin>(investor, amount * bond.face_value);
        coin::deposit<AptosCoin>(issuer, payment);

        // Update total bonds issued
        bond.total_issued = bond.total_issued + amount;
    }
}
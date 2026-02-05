# AlphaCoin Architecture

## Goals
- **Handles small + large payments** with predictable fees and fast settlement.
- **Full nodes** validate every transaction and smart contract execution.
- **Smart contracts** enable programmable payments and automated escrow.
- **Wallet UX** supports cold storage, hardware signing, and watch-only accounts.

## Core components
### Full nodes
- Store the entire chain state and transaction history.
- Validate blocks, transactions, and smart contract execution deterministically.
- Participate in consensus, propagate blocks and transactions, and serve light clients.

### Consensus (reference)
- **Proof-of-Stake with finality checkpoints**: validators stake AlphaCoin and vote on blocks.
- **Finality gadget**: finality checkpoints every N blocks reduce reorg risk for large payments.
- **Slashing**: double-signing or censorship attempts result in stake slashing.

### Ledger model
- Account-based ledger with nonce ordering.
- Parallel transaction execution with deterministic ordering for smart contract calls.

### Smart contracts
- Contract bytecode runs in a deterministic virtual machine (VM).
- Gas metering prevents denial of service.
- Contracts can emit events for wallet UIs and analytics.

### Wallet + UI
- Wallets hold private keys locally, sign transactions offline, and broadcast via full nodes.
- UI supports payments, QR codes, contract interactions, and transaction history.
- Optional hardware-wallet integration for large-value transfers.

## Data flow
1. User creates a payment in the wallet.
2. Wallet signs the transaction locally.
3. Transaction broadcasts to full nodes.
4. Full nodes validate and include the transaction in a block.
5. Finality checkpoint confirms the transaction permanently.

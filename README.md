# AlphaCoin

AlphaCoin is a digital currency concept designed to handle both micro-payments and large-value transfers with the same core protocol. This repository contains a lightweight reference implementation outline, security model, smart contract example, and a wallet UI mock to demonstrate the user experience.

## What is included
- **Architecture overview** describing full nodes, consensus, networking, and smart contracts. See `docs/architecture.md`.
- **Security + encryption model** with key management, signing, and transport protections. See `docs/security.md`.
- **Smart contract example** for token logic, mint/burn, and transfer rules. See `contracts/AlphaCoin.sol`.
- **Wallet UI mock** as a static web app. See `web/`.
- **Client-side crypto helpers** that demonstrate signing and encryption workflows. See `src/crypto.js`.

## Quick start (wallet UI)
```bash
cd web
python3 -m http.server 8080
```
Then open `http://localhost:8080`.

## Disclaimer
This is a conceptual reference. It is **not** production-ready or audited. Cryptography, consensus, and smart contract logic must be formally verified and independently audited before real-world use.

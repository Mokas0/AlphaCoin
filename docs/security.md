# AlphaCoin Security & Encryption Model

## Threat model
- Network adversaries attempting transaction replay or censorship.
- Key compromise via phishing or device malware.
- Smart contract abuse, reentrancy, or integer overflow.

## Encryption choices
- **Elliptic-curve signatures**: Ed25519 for fast, modern signatures.
- **Key exchange**: X25519 for establishing secure transport channels.
- **Symmetric encryption**: AES-256-GCM for data at rest and peer-to-peer payloads.
- **Hashing**: BLAKE3 for transaction and block hashing.

## Security system design
1. **Local key isolation**
   - Private keys never leave the device.
   - Hardware wallet support for high-value transfers.
   - Optional multi-signature accounts (M-of-N).

2. **Transaction signing**
   - Deterministic signing with unique nonces.
   - Signed payload includes chain ID and nonce to prevent replay.

3. **Secure transport**
   - Node-to-node communication via TLS 1.3 with mutual authentication.
   - Transaction broadcast over encrypted channels with peer reputation scoring.

4. **Smart contract safety**
   - Gas limits and static analysis to detect reentrancy.
   - Standard libraries for safe math and access control.

5. **Finality + fraud detection**
   - Finality checkpoints limit deep reorgs.
   - Real-time monitoring for abnormal behavior.

## Operational recommendations
- Enforce regular key rotation for validator operators.
- Mandatory security audits for contracts holding user funds.
- Bug bounty program for protocol-level issues.

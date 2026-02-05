/*
  AlphaCoin client-side crypto helpers (reference only).
  These functions demonstrate the flow for key generation, signing,
  and encryption using Web Crypto APIs.
*/

export async function generateKeyPair() {
  return window.crypto.subtle.generateKey(
    {
      name: "Ed25519",
      namedCurve: "Ed25519",
    },
    true,
    ["sign", "verify"]
  );
}

export async function signPayload(privateKey, payload) {
  const encoded = new TextEncoder().encode(payload);
  return window.crypto.subtle.sign("Ed25519", privateKey, encoded);
}

export async function verifySignature(publicKey, payload, signature) {
  const encoded = new TextEncoder().encode(payload);
  return window.crypto.subtle.verify("Ed25519", publicKey, signature, encoded);
}

export async function encryptMessage(key, plaintext) {
  const iv = window.crypto.getRandomValues(new Uint8Array(12));
  const encoded = new TextEncoder().encode(plaintext);
  const ciphertext = await window.crypto.subtle.encrypt(
    { name: "AES-GCM", iv },
    key,
    encoded
  );
  return { iv, ciphertext };
}

export async function decryptMessage(key, iv, ciphertext) {
  const decrypted = await window.crypto.subtle.decrypt(
    { name: "AES-GCM", iv },
    key,
    ciphertext
  );
  return new TextDecoder().decode(decrypted);
}

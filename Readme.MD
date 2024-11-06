# Quadratic Voting with Noir: A Privacy-Preserving Voting System

This example demonstrates a privacy-preserving voting system using Quadratic Voting (QV), where users can cast votes without revealing their preferences to anyone except a trusted ballot manager. The ballot manager, however, cannot censor or modify any votes. The implementation focuses on Zero-Knowledge (zk) circuits, which, in a real-world scenario, would be coordinated by a consensus mechanism, such as blockchain validation.

## Key Circuits

### Count Votes (Manager Circuit)

- Ensures that all publicly committed votes are counted accurately.
- Outputs the aggregated vote totals, which are shared publicly for transparency.

## How It Works

The circuits for casting and counting votes can be built, proved, and verified using `nargo`. This system ensures that users' votes remain private, while the ballot manager can confidently count votes without the risk of manipulation or censorship.

#!/bin/bash

cd validator
cargo build --release
cd ../ledger-tool
cargo build --release
cd ..

target/release/solana-ledger-tool verify -l mainnet-beta/validator-ledger --halt-at-slot 123056012 >master2.log 2>&1

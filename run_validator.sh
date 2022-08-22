#!/bin/bash

#export SOLANA_METRICS_CONFIG="host=https://internal-metrics.solana.com:8086,db=testnet-dev-hyi,u=hyi,p=utlR2aGJzo1mF"
export SOLANA_METRICS_CONFIG="host=https://metrics.solana.com:8086,db=mainnet-beta,u=mainnet-beta_write,p=password"
RUST_LOG=solana=info,solana_runtime::message_processor=warn \
cargo run --release --bin solana-validator -- \
        --identity validator-keypair.json \
        --vote-account vote-account-keypair.json \
        --ledger validator-ledger \
        --rpc-port 15560 \
	--log validator.log \
        --dynamic-port-range 15501-15550 \
        --entrypoint mainnet-beta.solana.com:8001 \
   --entrypoint entrypoint.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint2.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint3.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint4.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint5.mainnet-beta.solana.com:8001 \
    --limit-ledger-size \
       	--no-poh-speed-test \
	--trusted-validator CakcnaRDHka2gXyfbEd2d3xsvkJkqsLw2akB3zsN1D2S \
        --trusted-validator DE1bawNcRJB9rVm3buyMVfr8mBEoyyu73NBovf2oXJsJ \
        --trusted-validator GdnSyH3YtwcxFvQrVVJMm1JhTS4QVX7MFsX56uJLUfiZ \
        --trusted-validator 7Np41oeYqPefeNQEHSv1UDhYrehxin3NStELsSKCT4K2 \
        --no-untrusted-rpc \
	--snapshot-interval-slots 400 \
	--no-check-vote-account \
	--no-os-network-limits-test 

## testing snapshot service
# --no-snapshot-fetch
#--maximum-local-snapshot-age 1000

# --account-index spl-token-mint \
#--accounts-index-path /mnt/data/accounts_index \
	#--accounts-index-path validator-ledger/accounts_index \
	#--accounts-index-memory-limit-mb 0 \
	#:wq--accounts-filler-count 200000001 \
	#--accounts-db-test-hash-calculation \
        #--no-snapshot-fetch \
        #--contact-debug-interval 60000 \
        #--no-genesis-fetch \
        #--expected-shred-version 64864 \
        #--cuda \
        #--trusted-validator FfE3UwUoc4M5p83Hwwh28rjtusfSHbKHJsEkdaeoQ324 \
        #--trusted-validator EZNfFUR2znQqdVzmXFNKavWBn1Lvk5Rwfuybe6yS2YWN \
        #--wait-for-supermajority 9151093 \
        #--no-untrusted-rpc
        #--trusted-validator 5D1fNXzvv5NjV1ysLjirC4WY92RNsVH18vjmcszZd8on \

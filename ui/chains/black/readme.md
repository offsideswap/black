For reference when playing with cosmos cain

# Create liquidity pool catk:fury

```
blackfuryd tx clp create-pool \
 --from akasha \
 --symbol catk \
 --nativeAmount 500 \
 --externalAmount 500
```

# Create liquidity pool cbtk:fury

```
blackfuryd tx clp create-pool \
 --from akasha \
 --symbol cbtk \
 --nativeAmount 500 \
 --externalAmount 500
```

# Verify pool created

```
blackfuryd query clp pools
```

# Execute swap

```
blackfuryd tx clp swap \
 --from shadowfiend \
 --sentSymbol catk \
 --receivedSymbol cbtk \
 --sentAmount 20
```

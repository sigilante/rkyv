#   `%rkyv`

A toy database implementation for Urbit.

- Demonstrates a key-value store for a document database.
- Supports batch operations as pokes.
- Demonstrates a "conventional" agent structure and an operationally-equivalent "nested core" agent.

The following will load a collection of files from a folder into the database, with the file name as the key.

```
kjv/
├── acts-10-10.txt
├── acts-10-11.txt
├── acts-10-12.txt
* * *
├── zephaniah-3-7.txt  
├── zephaniah-3-8.txt  
└── zephaniah-3-9.txt
```

The desk `%data` and `/gen/verse.hoon` are both particular to the above data set.

```hoon
> :rkyv|load /=data=/kjv

> .^(cord %gx /=rkyv=/key/genesis-1-1/txt/noun)
'1:1  In the beginning God created the heaven and the earth.'

> +data!verse 'Genesis 1:1'
'1:1  In the beginning God created the heaven and the earth.'
```


# ipgrep

Match IP using grep via PCRE regex 

## What ?

The regex exclude network adress, IPv4 class D and E (for casting).

## Explanation

`|` = "or"

`\.` = dot .

`\b` = border, every char that is a separator : space, return, end of line, tab, ...

`(` and `)` are used to capture result so add a condition


### For the 1st byte :

```
(
 2[0-2][0-3]  = 200 upto 223
|1[0-9][0-9]  = 100 upto 199
 |[1-9][0-9]  =  10 upto 99
      |[0-9]  =   0 upto 9
)
```

### For the 2nd and 3rd bytes :

```
(
  2[0-5][0-5] = 200 upto 255
 |1[0-9][0-9] = 100 upto 199
 |[1-9]?[0-9] =   0 upto 199
)
```

### For the 4th byte :

```
(
  2[0-5][0-4] = 200 upto 254
 |1[0-9][0-9] = 100 upto 199
  |[1-9][0-9] =  10 upto 99
       |[1-9] =   1 upto 9
)
```


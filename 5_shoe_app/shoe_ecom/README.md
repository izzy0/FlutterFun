# shoe_ecom

## Theme Data
trying to get rid of the divider bar in the DrawerHeader? Wrap it in a Theme Data
```
 Theme(
    data: Theme.of(context).copyWith(
        dividerTheme:
            const DividerThemeData(color: Colors.transparent),
    ),
    child: DrawerHeader(
        child: ...
    ),
),
```

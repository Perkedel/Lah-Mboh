# GitHub Quote Highligt

GitHub has a special syntax in Markdown where you can give highlight type to your `>` quotes with a special Bracket syntax.

The following, are the supported brackets you can use to mark it.

## Code

```
> [!NOTE]  
> Highlights information that users should take into account, even when skimming.

> [!TIP]
> Optional information to help a user be more successful.

> [!IMPORTANT]  
> Crucial information necessary for users to succeed.

> [!WARNING]  
> Critical content demanding immediate user attention due to potential risks.

> [!CAUTION]
> Negative potential consequences of an action.
```

## Results

Here's how they looks like

> [!NOTE]  
> Highlights information that users should take into account, even when skimming.

> [!TIP]
> Optional information to help a user be more successful.

> [!IMPORTANT]  
> Crucial information necessary for users to succeed.

> [!WARNING]  
> Critical content demanding immediate user attention due to potential risks.

> [!CAUTION]
> Negative potential consequences of an action.

If that does not work, check if you typo, or if you used unsupported flag.

## Legacy

I believe that this idea currently is on GitHub only right now. So, if you used Git hosting that its doc reader does not supports above special Bracketings, you can just use `**BOLD**` instead. Like this:

```
> **Note**
> This is a note

> **Warning**
> This is a warning
```
And it sort of gave pseudo Title & Desc effect

> **Note**
> This is a note

> **Warning**
> This is a warning

## Sauce

https://github.com/orgs/community/discussions/16925
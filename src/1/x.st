| fileName x lines |

fileName := 'x.txt'.

x := (FileStream open: fileName mode: FileStream read).

lines := x contents asOrderedCollection.

x close.

lines printNl.

